/*************************************************************************

  Copyright 2011-2013 Ibrahim Sha'ath

  This file is part of LibKeyFinder.

  LibKeyFinder is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  LibKeyFinder is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with LibKeyFinder.  If not, see <http://www.gnu.org/licenses/>.

*************************************************************************/

#ifndef CHROMAGRAM_H
#define CHROMAGRAM_H

#include <cmath>
#include <vector>
#include <cmath>
#include "parameters.h"

namespace KeyFinder{

  class Chromagram{
  public:
    Chromagram(unsigned int hops = 0, unsigned int bins = 0);
    Chromagram(const Chromagram& that);
    void setMagnitude(unsigned int hop, unsigned int bin, float value);
    float getMagnitude(unsigned int hop, unsigned int bin) const;
    unsigned int getHops() const;
    unsigned int getBins() const;
    void reduceToOneOctave(const Parameters& params);
    void reduceTuningBins(const Parameters& params);
  private:
    unsigned int hops;
    unsigned int bins;
    std::vector<std::vector<float> > chromaData;
    void tuningHarte(const Parameters&);
    void tuningBinAdaptive(const Parameters&);
  };

}

#endif

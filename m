Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EDBC3DA6D
	for <ath12k@archiver.kernel.org>; Fri, 23 May 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=le694XSYWE6RVk/YVetm5E7FCuIzvCIq7P47IsPfytE=; b=Ckbqnxx8Qf/rpNADf4dWzYezgf
	jpKMmF3dxxAZRiNxiAy/4gjD/5+KaWyF/o0wdefyOZaAlnbh1MZtT0G46tyCdPotxdqmDNUCsBuAv
	CznsugMwBDzLyVrvKmChFDrblWXMKRQIKu+9I/E0XJUhnf93as43MhLBnWyVVCRgU/i9ZzibVvkfo
	i5UmvfwCCBbtZBCciG26ouWCrGd5kYgsSBduWwJW9FYtA9Gj7s0+8dqV0FCdGIPN5kvmimF/Mo/Wm
	cAXYR6ILmpcHphT8OxxQngscNl5mSTcntOM4llnNmC3L4UYGbNo0gYTT6to+IAKhrTzoMUCXHS6YN
	vRCeMJ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIO1d-00000003Ko2-13zZ;
	Fri, 23 May 2025 08:45:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uINoZ-00000003JMi-1mh0
	for ath12k@lists.infradead.org;
	Fri, 23 May 2025 08:31:40 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a36abf5df9so442476f8f.0
        for <ath12k@lists.infradead.org>; Fri, 23 May 2025 01:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747989098; x=1748593898; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=le694XSYWE6RVk/YVetm5E7FCuIzvCIq7P47IsPfytE=;
        b=RUiDbd1SOZxzPKUVxB/3Zwh71Ljj4hTklcakpDitOgMaR250TEC6ZGu8ezSZT76w2S
         Fc1SVtylGsZoGWTX7VxIegkvKlrcgAC72DTp095yKGDz/uIgcWAlK1x6W3VrWu/m6PoG
         uePG6C1dF2vL5citWiW7rJZA2NkiZcPBRz23jRH/n73iV+7KllaOXg3Tjy7ciTImZhIs
         EN3oG63HZTSPGRNuVPYtYcREvQI6YjrFcMWsJUWUVPRXG4QN9Py0JpujurQZ5Cdfy27o
         Nn5LHMA/wCUyMh4oaUWg56RmPSkaJA56lg+f4PEVKcuH71rwajYDUMOYC3uaCCL3HUWW
         KmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747989098; x=1748593898;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=le694XSYWE6RVk/YVetm5E7FCuIzvCIq7P47IsPfytE=;
        b=hBlovVZs9Q61Rx/tsnlBpWcy/kiVykhE53ESwb7JoyIi8TZILgE6oa1pIBbKiXpjB8
         ppEbZulfT5MSXSgfN/U15AoRFylwPShwEYC+MAAxsqmhvL+pBWynkGjTmGXUy7ZLf+eV
         igyAWJA61zfoSdaIFhztHkm5BEHtsjEM7erpUEZnnXVFVvoc2teGsMUj9aEZfnIq5dXF
         PEyWKSMZsFtqgckHKL7mk7Flbe2qKNqSFYt7WWc8ML+I2F/XFizXp+b2UFuItSRTZ6tb
         DRLIUt1wGDO8PpjDMNvvan6P/iz7bfpU9UNJKTDcLR49f8KEV7IUZMenlnp52f0Jhjmr
         MfcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmouvgtzvX7zNZ1wZyD3tuVZygPAS1dcLNzg/v0HrA+OzT7bpP+QhTiOySiOTSWAwQPpH2oaA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjWUlGompf4crmURrncgor1/7quHh239/7o14W9VJVHhEIkfG8
	fLGlf+NJWDk2WdjmTVvLYC7g/c1OPObbWgGUUz/BreO0BxYv3VOOurXM4UatfBAG71w=
X-Gm-Gg: ASbGncvvzR2zbMTv4gXruBMA44ci5Lzy1yLcrYgsY9qaEwQVuaRL0JUdL/kXB77x3+P
	gIp8WZXuFUxgcZD9yaV/f1Y0gJAQFBec4Nr/gCQnYk+14QEqKyCEPYTyj9iq/mQ0nCksXSnVJYN
	PpwjHw+2vMGOe/B4v3oF9Hc7Qrlq2QwekUJMvAbz7z2BhQS1eQ2xcqRPdJ6hdmYVAz4q/fgUr0z
	/pUJ6Y0OYFLbLQD0RgnvW2X1gvEiWS08NDjb7QAxuEcUBr/ROPL2srrBFDIlbY3yQi5Po1ve2G1
	LQ81v8Cx0Iabla0wPaJsUJZTVKC4UnLnmZusy/KY1qF+DwtEjz8/TgsY
X-Google-Smtp-Source: AGHT+IEHiJg8FtJaRq9Kty0uh+3w1R54P+fvdmmVAyRZ2+UDfrkkVE/zSADNB2Bm3QdDJFAxAdqEvg==
X-Received: by 2002:a5d:64cd:0:b0:3a3:6d25:b8e2 with SMTP id ffacd0b85a97d-3a4c14ea5a0mr2267830f8f.6.1747989097564;
        Fri, 23 May 2025 01:31:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f78b0acasm129176085e9.31.2025.05.23.01.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 01:31:37 -0700 (PDT)
Date: Fri, 23 May 2025 11:31:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Baochen Qiang <quic_bqiang@quicinc.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [ath:pending-deferred 25/61]
 drivers/net/wireless/ath/ath12k/mac.c:10069 ath12k_mac_fill_reg_tpc_info()
 error: uninitialized symbol 'eirp_power'.
Message-ID: <202505180927.tbNWr3vE-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_013139_470981_D4371B09 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
head:   52c1e49f8c69a630f3dbe7dd79c52979cdad19d2
commit: aeda163bb0c7b9fc58bdd6ae90c0eef4f4050b7b [25/61] wifi: ath12k: fill parameters for vdev set TPC power WMI command
config: x86_64-randconfig-161-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180927.tbNWr3vE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505180927.tbNWr3vE-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:10069 ath12k_mac_fill_reg_tpc_info() error: uninitialized symbol 'eirp_power'.

vim +/eirp_power +10069 drivers/net/wireless/ath/ath12k/mac.c

aeda163bb0c7b9 Baochen Qiang 2025-04-18   9902  void ath12k_mac_fill_reg_tpc_info(struct ath12k *ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9903  				  struct ath12k_link_vif *arvif,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9904  				  struct ieee80211_chanctx_conf *ctx)
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9905  {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9906  	struct ath12k_base *ab = ar->ab;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9907  	struct ath12k_reg_tpc_power_info *reg_tpc_info = &arvif->reg_tpc_info;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9908  	struct ieee80211_bss_conf *bss_conf = ath12k_mac_get_link_bss_conf(arvif);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9909  	struct ieee80211_channel *chan, *temp_chan;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9910  	u8 pwr_lvl_idx, num_pwr_levels, pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9911  	bool is_psd_power = false, is_tpe_present = false;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9912  	s8 max_tx_power[ATH12K_NUM_PWR_LEVELS],
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9913  		psd_power, tx_power, eirp_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9914  	u16 start_freq, center_freq;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9915  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9916  	chan = ctx->def.chan;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9917  	start_freq = ath12k_mac_get_6ghz_start_frequency(&ctx->def);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9918  	pwr_reduction = bss_conf->pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9919  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9920  	if (arvif->reg_tpc_info.num_pwr_levels) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9921  		is_tpe_present = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9922  		num_pwr_levels = arvif->reg_tpc_info.num_pwr_levels;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9923  	} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9924  		num_pwr_levels = ath12k_mac_get_num_pwr_levels(&ctx->def);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9925  	}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9926  
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9927  	for (pwr_lvl_idx = 0; pwr_lvl_idx < num_pwr_levels; pwr_lvl_idx++) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9928  		/* STA received TPE IE*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9929  		if (is_tpe_present) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9930  			/* local power is PSD power*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9931  			if (chan->flags & IEEE80211_CHAN_PSD) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9932  				/* Connecting AP is psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9933  				if (reg_tpc_info->is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9934  					is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9935  					ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9936  								   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9937  								   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9938  								   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9939  								   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9940  								   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9941  					psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9942  					eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9943  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9944  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9945  						      psd_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9946  						      reg_tpc_info->tpe[pwr_lvl_idx]);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9947  				/* Connecting AP is not psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9948  				} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9949  					ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9950  								  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9951  								  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9952  								  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9953  								  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9954  								  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9955  								  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9956  					psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9957  					/* convert psd power to EIRP power based
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9958  					 * on channel width
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9959  					 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9960  					tx_power =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9961  						min_t(s8, tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9962  						      psd_power + 13 + pwr_lvl_idx * 3);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9963  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9964  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9965  						      tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9966  						      reg_tpc_info->tpe[pwr_lvl_idx]);

eirp_power is not set on this else path.

aeda163bb0c7b9 Baochen Qiang 2025-04-18   9967  				}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9968  			/* local power is not PSD power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9969  			} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9970  				/* Connecting AP is psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9971  				if (reg_tpc_info->is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9972  					is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9973  					ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9974  								   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9975  								   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9976  								   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9977  								   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9978  								   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9979  					eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9980  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9981  						reg_tpc_info->tpe[pwr_lvl_idx];
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9982  				/* Connecting AP is not psd power */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9983  				} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9984  					ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9985  								  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9986  								  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9987  								  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9988  								  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9989  								  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9990  								  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9991  					max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9992  						min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9993  						      tx_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9994  						      reg_tpc_info->tpe[pwr_lvl_idx]);
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9995  				}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9996  			}
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9997  		/* STA not received TPE IE */
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9998  		} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18   9999  			/* local power is PSD power*/
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10000  			if (chan->flags & IEEE80211_CHAN_PSD) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10001  				is_psd_power = true;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10002  				ath12k_mac_get_psd_channel(ar, 20,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10003  							   &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10004  							   &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10005  							   pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10006  							   &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10007  							   &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10008  				psd_power = temp_chan->psd;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10009  				eirp_power = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10010  				max_tx_power[pwr_lvl_idx] = psd_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10011  			} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10012  				ath12k_mac_get_eirp_power(ar,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10013  							  &start_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10014  							  &center_freq,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10015  							  pwr_lvl_idx,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10016  							  &temp_chan,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10017  							  &ctx->def,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10018  							  &tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10019  				max_tx_power[pwr_lvl_idx] = tx_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10020  			}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10021  		}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10022  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10023  		if (is_psd_power) {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10024  			/* If AP local power constraint is present */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10025  			if (pwr_reduction)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10026  				eirp_power = eirp_power - pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10027  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10028  			/* If firmware updated max tx power is non zero, then take
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10029  			 * the min of firmware updated ap tx power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10030  			 * and max power derived from above mentioned parameters.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10031  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10032  			ath12k_dbg(ab, ATH12K_DBG_MAC,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10033  				   "eirp power : %d firmware report power : %d\n",
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10034  				   eirp_power, ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10035  			/* Firmware reports lower max_allowed_tx_power during vdev
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10036  			 * start response. In case of 6 GHz, firmware is not aware
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10037  			 * of EIRP power unless driver sets EIRP power through WMI
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10038  			 * TPC command. So radio which does not support idle power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10039  			 * save can set maximum calculated EIRP power directly to
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10040  			 * firmware through TPC command without min comparison with
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10041  			 * vdev start response's max_allowed_tx_power.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10042  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10043  			if (ar->max_allowed_tx_power && ab->hw_params->idle_ps)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10044  				eirp_power = min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10045  						   eirp_power,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10046  						   ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10047  		} else {
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10048  			/* If AP local power constraint is present */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10049  			if (pwr_reduction)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10050  				max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10051  					max_tx_power[pwr_lvl_idx] - pwr_reduction;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10052  			/* If firmware updated max tx power is non zero, then take
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10053  			 * the min of firmware updated ap tx power
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10054  			 * and max power derived from above mentioned parameters.
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10055  			 */
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10056  			if (ar->max_allowed_tx_power && ab->hw_params->idle_ps)
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10057  				max_tx_power[pwr_lvl_idx] =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10058  					min_t(s8,
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10059  					      max_tx_power[pwr_lvl_idx],
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10060  					      ar->max_allowed_tx_power);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10061  		}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10062  		reg_tpc_info->chan_power_info[pwr_lvl_idx].chan_cfreq = center_freq;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10063  		reg_tpc_info->chan_power_info[pwr_lvl_idx].tx_power =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10064  			max_tx_power[pwr_lvl_idx];
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10065  	}
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10066  
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10067  	reg_tpc_info->num_pwr_levels = num_pwr_levels;
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10068  	reg_tpc_info->is_psd_power = is_psd_power;
aeda163bb0c7b9 Baochen Qiang 2025-04-18 @10069  	reg_tpc_info->eirp_power = eirp_power;
                                                                                   ^^^^^^^^^^
warning.

aeda163bb0c7b9 Baochen Qiang 2025-04-18  10070  	reg_tpc_info->ap_power_type =
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10071  		ath12k_reg_ap_pwr_convert(bss_conf->power_type);
aeda163bb0c7b9 Baochen Qiang 2025-04-18  10072  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F057C001E0
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=WYjFJoNJWcHUbd00yarKyrxTVp37TiDF2fWKD4nET6s=; b=xyjCiZWS3StCLP
	mYPLLACbJxSk1Wik/4E+2l3XyiaYbvYUD0gfIMxN/UPUjvzSlkLcIQ764zmRsuNqRjnY4Ni6drlH9
	yCMw4PTVWRxV+E1IKbFhJteX4K5Ec/Yz78vp+BL96BpZXSQWA+H3mryx9nqoDfBDyjMJG+uDrOyhZ
	AUKGG36LFtzLMiUcyqYOrd59ryAROk8GLvUGbF330sRLRPMkf7LA2c92jSTOlI9Vvnv59ln2ZimId
	bhRZhvLuXTUo+Nn2eR3KVZCla8tI/cQ/YhDyApMPyKgtu9We6g+BohCRgtb3QG14ES+CG2hkfODDB
	V0R2zoM0m8l0PReojEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFxd-007NRP-09
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 11:12:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOFxZ-007NPP-1c
	for ath12k@lists.infradead.org;
	Tue, 25 Jul 2023 11:12:11 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fb4146e8deso54383095e9.0
        for <ath12k@lists.infradead.org>; Tue, 25 Jul 2023 04:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690283521; x=1690888321;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E2TkVQOO2dvDhRwA4pB7+VODDjmGBCoGSf6JgGl78WU=;
        b=saKhX229943c1HQwfP6KJYHV7g6+MTIc8bdP4Wx4fmHKr4EmpNPAybLbBoQKej95O4
         1kRCDel1n297Sia30oN7JdiDZjoehPJuRgt8yaZtFkMskzThd3+JVVvDsZPpAdVsE2v9
         IYXNDc8ujGtrKqu2Zx3hvL7dLeFfzuM9OvlyCN6GkzLSPp9uY9Z6+4AMMCx/gWiQCzWf
         8iN9qU3YcAj5aKPOI6GXtCPJkfzN29ATrI4GY4xummyC6WAdCDZsKDxo69nJMhaKGkGW
         07TqHMg/4yjexpWh/dnYoskDiQOPVkmQNTdA6P+oPml981C35TE7O0WVjyRP8Ft1o5cm
         6VMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690283521; x=1690888321;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2TkVQOO2dvDhRwA4pB7+VODDjmGBCoGSf6JgGl78WU=;
        b=EgOMnTXkh8Z6BlMJEJES04EcXgyHkLoqZkxbfWUNOF/C6rR5MlUkwOKHfg/J9Dxhsx
         LKiJk4NQbwV0NWj8VPT2kKWNsZ/m5gxVv+Q4DYmwtodHy0S97LbirXBYhJM5XMS74t8C
         lGUga60ttCkIFVmE14N1ArspskfoJiUWn/kIjIDH9mWnALvNwLmb46+e/UNm90ywqo3M
         gB6MOSFhqQXA/fyoAQHd8gHHB6NSqGg/TWHMadNz/pIq0zRvFNBn8TZFxD3tTeleWDrg
         Me7NT7jkA5van1m0b+A9oOT2/gunAm7qxYiZg4wsXiljONNtIgHDcr55EdHgU4xxwddR
         SV5w==
X-Gm-Message-State: ABy/qLZg/IhFLcGKBZC0eY0c0sAGG0xGktkBQQZ/0S3YvlfVD2YY7fXd
	9fx/vXhqGtv+QWrzIehOwO9v0Q==
X-Google-Smtp-Source: APBJJlFtYHDH6CTtEO16m5ro5wjfYDfJjQbh+xQfQtEkhRfEEwHBAFBvVC5XQLWJtskAn75aUWjHLw==
X-Received: by 2002:a05:600c:234a:b0:3fd:2a34:e867 with SMTP id 10-20020a05600c234a00b003fd2a34e867mr8154570wmq.25.1690283521115;
        Tue, 25 Jul 2023 04:12:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t10-20020a1c770a000000b003faef96ee78sm15730467wmi.33.2023.07.25.04.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 04:12:00 -0700 (PDT)
Date: Tue, 25 Jul 2023 14:11:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wen Gong <quic_wgong@quicinc.com>,
	johannes@sipsolutions.net, ath12k@lists.infradead.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org, quic_wgong@quicinc.com
Subject: Re: [PATCH] wifi: mac80211: avoid buffer overflow by adding clear
 data of VHT Tx power envelope
Message-ID: <311e08c7-c553-4722-8dd1-1556e8063479@kadam.mountain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721055851.20525-1-quic_wgong@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_041209_544158_3952949A 
X-CRM114-Status: UNSURE (   8.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi Wen,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Wen-Gong/wifi-mac80211-avoid-buffer-overflow-by-adding-clear-data-of-VHT-Tx-power-envelope/20230721-140122
base:   b21fe5be53eb873c02e7479372726c8aeed171e3
patch link:    https://lore.kernel.org/r/20230721055851.20525-1-quic_wgong%40quicinc.com
patch subject: [PATCH] wifi: mac80211: avoid buffer overflow by adding clear data of VHT Tx power envelope
config: i386-randconfig-m021-20230723 (https://download.01.org/0day-ci/archive/20230725/202307251807.z04UOfqH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251807.z04UOfqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307251807.z04UOfqH-lkp@intel.com/

New smatch warnings:
net/mac80211/mlme.c:4818 ieee80211_prep_channel() error: we previously assumed 'link' could be null (see line 4792)
net/mac80211/mlme.c:4890 ieee80211_prep_channel() warn: variable dereferenced before check 'link' (see line 4818)

Old smatch warnings:
net/mac80211/mlme.c:7073 ieee80211_setup_assoc_link() warn: variable dereferenced before check 'elem' (see line 7071)

vim +/link +4818 net/mac80211/mlme.c

7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4789  	if (!(*conn_flags & IEEE80211_CONN_DISABLE_HE)) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4790  		he_oper = elems->he_operation;
d524215f6cad245 net/mac80211/mlme.c          Felix Fietkau     2010-01-08  4791  
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12 @4792  		if (link && is_6ghz) {

Check for NULL

4df17235d03fd79 net/mac80211/mlme.c          Wen Gong          2023-07-21  4793  			struct ieee80211_bss_conf *bss_conf = link->conf;;
a607268a0d5532d net/mac80211/ieee80211_sta.c Bruno Randolf     2008-02-18  4794  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4795  			if (elems->pwr_constr_elem)
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4796  				bss_conf->pwr_reduction = *elems->pwr_constr_elem;
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4797  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4798  			BUILD_BUG_ON(ARRAY_SIZE(bss_conf->tx_pwr_env) !=
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4799  				     ARRAY_SIZE(elems->tx_pwr_env));
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4800  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4801  			for (i = 0; i < elems->tx_pwr_env_num; i++) {
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4802  				if (elems->tx_pwr_env_len[i] >
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4803  				    sizeof(bss_conf->tx_pwr_env[j]))
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4804  					continue;
1d00ce807efaa0e net/mac80211/mlme.c          Thomas Pedersen   2020-09-21  4805  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4806  				memcpy(&bss_conf->tx_pwr_env[j], elems->tx_pwr_env[i],
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4807  				       elems->tx_pwr_env_len[i]);
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4808  				j++;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4809  			}
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4810  		}
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4811  
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4812  		if (!ieee80211_verify_peer_he_mcs_support(sdata, ies, he_oper) ||
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4813  		    !ieee80211_verify_sta_he_mcs_support(sdata, sband, he_oper))
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4814  			*conn_flags |= IEEE80211_CONN_DISABLE_HE |
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4815  				       IEEE80211_CONN_DISABLE_EHT;
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4816  	}
1d00ce807efaa0e net/mac80211/mlme.c          Thomas Pedersen   2020-09-21  4817  
4df17235d03fd79 net/mac80211/mlme.c          Wen Gong          2023-07-21 @4818  	link->conf->tx_pwr_env_num = j;
                                                                                        ^^^^^^^^^^
Unchecked dereference

4df17235d03fd79 net/mac80211/mlme.c          Wen Gong          2023-07-21  4819  
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4820  	/*
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4821  	 * EHT requires HE to be supported as well. Specifically for 6 GHz
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4822  	 * channels, the operation channel information can only be deduced from
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4823  	 * both the 6 GHz operation information (from the HE operation IE) and
61513162aa2d6c1 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4824  	 * EHT operation.
66e67e418908442 net/mac80211/mlme.c          Johannes Berg     2012-01-20  4825  	 */
7781f0d81c7a7e6 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4826  	if (!(*conn_flags &

[ snip ]

1ad22fb5bb53ce6 net/mac80211/mlme.c          Tosoni            2018-03-14  4879  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4880  	*conn_flags |=
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4881  		ieee80211_determine_chantype(sdata, link, *conn_flags,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4882  					     sband,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4883  					     cbss->channel,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4884  					     bss->vht_cap_info,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4885  					     ht_oper, vht_oper,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4886  					     he_oper, eht_oper,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4887  					     s1g_oper,
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4888  					     &chandef, false);
78ac51f81532c1e net/mac80211/mlme.c          Sara Sharon       2019-01-16  4889  
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12 @4890  	if (link)

More checks for NULL

6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4891  		link->needed_rx_chains =
6911458dc4283a7 net/mac80211/mlme.c          Johannes Berg     2022-07-12  4892  			min(ieee80211_max_rx_chains(link, cbss),

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

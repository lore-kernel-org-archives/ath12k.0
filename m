Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F181606A31C
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 19:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xVf9hrN3;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ooPOdwhb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bR97xdFK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=c8s7W03u8xrPY2+8UUOn5CnU3KETPxQF/eEC5uNB4ik=; b=xVf9hrN3ShvoDGkKkMxjykc/Ep
	lisHtOE7xKZG1pQEFFb/eUy2NCzGBZtsYavLP3ahDey5SCndp3MrvzvXg4Cio2rEdZdv/V9KAXARF
	J5RAQ975E8z3+w57f1Qo6OtyGwvSlBaDtaZN4Hm/qcsBTELlCePCOC2DnAjIaRypyReUY47HhUP/H
	/jUYmrHDkQ7pmyoTpj34ZKoQvTBEBV5V41qZ/SDBjLI7FaQMinf57eEkz+L5UdaEYusHi/ScR7i2w
	sIqtRJVQbwmK4buqJP2Idfl/C0yBnvchltuWHXjzB1Jt0wGwX5ictKaluwHkjTxtFXKGUTy5ncwK/
	1OUCTwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkth-0000000A3NX-325o;
	Wed, 18 Nov 2026 19:00:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTktc-0000000A3M3-47xD
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 19:00:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHGBrO2745587
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 19:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c8s7W03u8xrPY2+8UUOn5C
	nU3KETPxQF/eEC5uNB4ik=; b=ooPOdwhb8m5hUgHSbMZJgxSfPCdCGcL++O5yS6
	lf7GiSIdFlc8RDJD7E3KQPlFyk4QV9uwpBJehGGIEFoMzTvCCm7Hdr75ltQ3Bknj
	19iWp7Zsv/qc6rkTZMDla8Lc2M/vKwzhJUU1glIv9EYI7q9NFJWesG60xAPc61EG
	rh1oyteFV3LWpDXI9n+3kwZbsQsjSKSYC/7R5YWbPel4ErwZr7nlKN0Mv4nrwByn
	pndMSrMKQGkKtIOoqSROEnv9L+OOmi+NRSGxMF0RmG+cw7FmPNzzxNeWsjn9VEBS
	186m6BQj9fsypm0KaSlp5h4a6nJ3ojVI4ziEiBje5/1ddhMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1fpngn9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 19:00:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fa6c8d4bso5529a91.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 11:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795028440; x=1795633240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c8s7W03u8xrPY2+8UUOn5CnU3KETPxQF/eEC5uNB4ik=;
        b=bR97xdFKFeb/gmaeRawSYnrIp8ltWJPaCA5jXVQSUEb7TG1AHHGSzKxqXOH8JCBwYs
         7ckisjqEO+h/3h52f9C3tswi1uTiIxN+xGGGWGI+QKZUAFCGgwBMg6plnQFphYOTS93W
         /Kt+NcVdzktadXNp9CEVm4wA8u9eFVhW+ua6q3ibAhjY6r5iEhyz3yjsDFoSSBDO/p6U
         +IRaIRs2138ITQWNq4pP4+WB80g9zTRjM+JIHf6uDedQH1YTXQc9TfION5rkDoqEvyYu
         etI+0jxUlGngFV939DobVzoN7WTqoLcTD4XMcxlQulV+G9VAzV4Z8a/A56R7BxzM/WAX
         tNww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795028440; x=1795633240;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c8s7W03u8xrPY2+8UUOn5CnU3KETPxQF/eEC5uNB4ik=;
        b=oXxmXAQqrMdDU6smHGlxdowO8IWHhiZTYARX5DW/b4oS906vpJkbXpMmPylTYI5rme
         SWMIF9cRo2PRfFoIXTyazq//AhcoQKgfHebFZlfpARtU+8oR/ruJzgurcT62zqr/SMZF
         Ek2VeyVgeLITVQun3MBwKJ3VQV0oijTCxb1XVBIYtDOnUGdSbopr0Z+9dLbYfvuNntly
         xDfpFGR+slaLypEbT82Pov8NFcNjaly2y0DzBrdwilpmqOBNGn2OYjuxByqydkhzG5dQ
         /VUYAtJRqYhFEn1DbkW335LYWd+AURfYak9lv15nmkRWV1BoIjGJBLeM1qE0r3zOGSm+
         mTcA==
X-Forwarded-Encrypted: i=1; AL+hErEYisAPA3DqmvK9QSu0UcOjeOb8f++FbusIZfa7jyZcjJy3Dnj/+SgO33xYMgIQt2rNoKo96nQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z8sr9ZOXm2Zq2gPXhXeoOu2LLGOgJ80kEov4UWzUMVU3mOQ6BkS
	Ku/Qv4NWP1tFEyJM86XRLnVpQuKBmPICtKn4xPq4yjqBb0vv/yXCnhkVNtwCL2BzlF2e3DLZ2HU
	7wOkFpBZ80s5TRe4sj/CsKOjx2DPXPdw87DO+kEHMfsdbtmTPblGC/f6xGODae4UN
X-Gm-Gg: AZFdTZfO3UEojbqnd7JDHXQxd1rOjQZUkhTWmQcYY0YXFAn2hNaUyg0nf4xPwAcr7tm
	FyplhD+O9cqHtT/WwCI8IkxSoZvE61Hh+HdpdXdkXTv3KEsau4sB76HBu3H3GqdhmTUvwc46I4/
	FaqrPkAUcb8Li9xGPDCpUW4WFJghirxPVMtb3dN6HLAhm0+v4e9fqFRl0H2jbyIEFfRLKFFzZ//
	CJ+wgzyhO4DczTkfCIMBy0pdgJAYxTYzPDWJmYR6PkyiaTnMdWOehFrp75QGFnFYjFCHmFvu5K0
	ir80HnRZD4s/LaiPS6IzftToXjrlf11orQtR1xj/Nkd20vI+MG20eMS0lHVXSnBOzS9AbeXEmJ4
	El3kp+NBuD4ESnACpVQGGdiYMw5TvvSm6FGPfzclIOSh0ZR9wz/Nj+pPpHE5bg7ReTf4WTjcO/j
	t+Bx68mzGwuw==
X-Received: by 2002:a17:90b:4b8b:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b3f590e309mr239060a91.3.1795028439555;
        Wed, 18 Nov 2026 11:00:39 -0800 (PST)
X-Received: by 2002:a17:90b:4b8b:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b3f590e309mr239032a91.3.1795028438824;
        Wed, 18 Nov 2026 11:00:38 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d56c9c2csm2440294a91.3.2026.11.18.11.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 11:00:38 -0800 (PST)
Message-ID: <3b986680-b15f-41c5-a302-f089a276488d@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:00:37 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20261118
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: f3ZQaG1ENhwVOMNpsPwdF8oWb9MXalfR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX6Ed+EXP/rZWg
 cwhUyNttekFS5w9doffih4cw8oks6a1GCTndw7kOlnuDsCblBjsOuvkJkjQ+phbspfFwmfvX8Po
 HRyAp0UZgWFawFDGGvzhs2MvxuWog6BPFC0b5zCHe3LfsasW4HQudKShpzkX/xRrSaRb2b0hnFH
 H70kJFd7ft/H95iIVLs1JwdACksvoOz3JbN2z6TtFq2tSh40OVAkiRlqYZuFijoq3rexwZFW3/F
 luxj5dSTTyafRJR1UJXk8BNxVB15wQwk8WBgOOCfsoGVCqgW4XczoRMyf7Ln6ftvkXjG6pfC5pt
 ECwQ/ntLCMnga4cweP0SeMJiO7CtUtL8ClpJEaU51SIP7wuI9OwjbtQAL4hnH6M2Mtg+MBCqJJD
 LusAx544IjgJsT1EpfwzJ1mLf22trLk+6rnyIDnstiSPVLKGPDEz2MESTw5mBiJovH5LeLx/3F8
 3bHnyetXwgHrXWJPKYQ==
X-Proofpoint-ORIG-GUID: f3ZQaG1ENhwVOMNpsPwdF8oWb9MXalfR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NSBTYWx0ZWRfX3fpIKuutmUzt
 hvyiTbgA0hZUVyPiX2so0Ektx584NxvfBvzqvtmj24uPNW3/0gSRnRF4yfhpY/S13RNbc27f/Rr
 JzDAuGYvQQYdWUaS7PmH9pMS4+kDPhg=
X-Authority-Analysis: v=2.4 cv=PJ6aavqC c=1 sm=1 tr=0 ts=6afdf5d8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=qvpC8K6VnTLLHDY92LYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_110041_030943_34F6A435 
X-CRM114-Status: GOOD (  15.05  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The following changes since commit 2c50cd5d10e8723797f28c7978f1f61688e0c0d2:

  wifi: cfg80211/mac80211: apply HE OBSS PD settings on beacon update (2026-10-26 12:38:14 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20261118

for you to fetch changes up to 1983b40acfcb3c3464b291c85977290a785bcfdc:

  .mailmap: Add entry for Vignesh Viswanathan (2026-11-18 08:57:26 -0800)

----------------------------------------------------------------
ath.git patches for v7.5 (PR #1)

A lot of assorted cleanups and bug fixes spread across the ath family of
Wi-Fi drivers. Items of note include...

ath9k:
Multiple fixes for the AR9271 USB driver.

ath10k:
Add Loic Poulain as maintainer.
Add experimental support for USB-attached QCA9377-7.

ath12k:
Add support for QCN6432.
Resolve differences in firmware link ID handling.

.mailmap:
Redirect e-mail away from disabled quic_*@quicinc.com mailboxes.

----------------------------------------------------------------
Aaradhana Sahu (10):
      dt-bindings: net: wireless: Add QCN6432
      wifi: ath12k: Refactor PCI operations and MSI config structure
      wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
      wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
      wifi: ath12k: add support for unified data-region memory allocation
      wifi: ath12k: move MSI config to pci.c
      wifi: ath12k: Add platform MSI support for CE
      wifi: ath12k: use CMEM write for PPT on hybrid bus devices
      wifi: ath12k: Resolve userPD ID per device
      wifi: ath12k: Add QCN6432 AHB support

Aishwarya R (3):
      wifi: ath12k: store station pointer only in dp_peer
      wifi: ath12k: move is_authorized flag to ath12k_sta
      wifi: ath12k: remove duplicate ucast_ra_only assignment in dp_peer_create

Arnd Bergmann (2):
      wifi: ath12k: fix QCOM_RPROC_COMMON dependency
      wifi: ath12k: add GENERIC_MSI_IRQ dependency

Baochen Qiang (11):
      wifi: ath12k: fix potential OOB access due to unverified hardware link id
      wifi: ath12k: skip hw link id match for devices without hw link id support
      wifi: ath12k: rename ath12k_dp_peer::hw_links to link_id_map
      wifi: ath12k: rename ath12k_dp_link_peer::hw_link_id to drv_link_id
      wifi: ath12k: rename ath12k_skb_rxcb::hw_link_id to drv_link_id
      wifi: ath12k: derive device id without drv_link_id for single device group
      wifi: ath12k: add support for HTT_T2H_MSG_TYPE_PEER_EXTENDED event
      wifi: ath12k: allocate logical link id on host when firmware does not report it
      wifi: ath12k: derive REO RX drv_link_id per device via HAL ops
      wifi: ath12k: derive WBM RX drv_link_id per device via HAL ops
      wifi: ath12k: use link_id_map to resolve RX link id for all devices

Chunkai Deng (1):
      mailmap: add entry for Chunkai Deng

Ernest Van Hoecke (1):
      dt-bindings: wireless: ath12k: allow calibration variant for WCN7850

Gaole Zhang (1):
      wifi: ath12k: Add EHT capabilities to scan probe frame

Guangshuo Li (1):
      wifi: ath12k: Fix potential SRNG configuration leak on init failure

Harshitha Prem (1):
      .mailmap: add entry for Harshitha Prem

Jeff Johnson (2):
      wifi: ath10k: Add Loic Poulain as maintainer
      wifi: ath12k: use str_enable_disable() in mac.c

Jiale Yao (1):
      wifi: ath11k: Reject short management RX frames

Jie Gan (1):
      .mailmap: add entries for Jie Gan

Jie Zhang (1):
      mailmap: add entry for Jie Zhang

Jose Ignacio Tornos Martinez (1):
      wifi: ath12k: fix wrong register read for RU start index of 80_3 segment

Kang Yang (1):
      mailmap: add entry for Kang Yang

Karthikeyan Periyasamy (1):
      .mailmap: add entries for Karthikeyan Periyasamy

Krzysztof Kozlowski (1):
      wifi: ath10k: Drop unused qmi_elem_info arrays

Madhavan Ganesan (2):
      wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
      wifi: ath12k: refactor m3 and aux_uc firmware memory handling

Michail Andreas Michalopoulos (2):
      wifi: ath9k: don't read past short WMI command responses
      wifi: ath9k: drop WMI command responses when no command is pending

Nerijus Bendžiūnas (8):
      wifi: ath9k: return an error from a failed multi-register read
      wifi: ath9k_htc: fix the byte count of a full RMW buffer flush
      wifi: ath9k_htc: refuse a command that fills whole USB packets
      wifi: ath9k: stop a failed register read from opening the RX filter
      wifi: ath9k: clear the PHY error filter when a spectral scan is disabled
      wifi: ath9k: count spectral samples in the driver's own RX stats
      wifi: ath9k_htc: pass CRC-tagged spectral samples to the FFT parser
      wifi: ath9k_htc: derive the PHY error filter bits from software state

P Praneesh (1):
      .mailmap: add entries for P Praneesh

Paulson Raja L (1):
      wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links

Prashanth K (1):
      .mailmap: add entries for Prashanth K

Rameshkumar Sundaram (1):
      wifi: ath12k: Fix HE BA mode configuration for AP mode

Rosen Penev (2):
      wifi: ath11k: don't select ATH_COMMON
      wifi: ar5523: don't select ATH_COMMON

Sarika Sharma (1):
      .mailmap: add entry for Sarika Sharma

Sebastian Andrzej Siewior (1):
      wifi: wil6210: Replace %pK with %p

Shazad Hussain (1):
      .mailmap: add entries for Shazad Hussain

Sowmiya Sree Elavalagan (7):
      wifi: ath12k: Add hardware parameter for QCN6432
      wifi: ath12k: Add hardware ring mask for QCN6432
      wifi: ath12k: add hardware registers for QCN6432
      wifi: ath12k: Add hif operation support for QCN6432
      wifi: ath12k: Enable MSI interrupt support for DP interrupt
      wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
      wifi: ath12k: Derive QMI service instance ID per protection domain

Sumit Kumar (1):
      mailmap: add entry for Sumit Kumar

Tamizh Chelvam Raja (1):
      .mailmap: add entries for Tamizh Chelvam Raja

Tomas Paukrt (1):
      wifi: ath10k: add hw_params for Atheros QCA9377-7

Uwe Kleine-König (1):
      wifi: ath10k: sdio: Use pm_sleep_ptr instead of #ifdef CONFIG_PM_SLEEP

Vignesh Viswanathan (1):
      .mailmap: Add entry for Vignesh Viswanathan

Wei Zhang (1):
      .mailmap: add entry for Wei Zhang

Wenmeng Liu (1):
      .mailmap: add entries for Wenmeng Liu

Yingying Tang (1):
      .mailmap: add entries for Yingying Tang

Yu Zhang(Yuriy) (1):
      .mailmap: add entry for Yu Zhang(Yuriy)

 .mailmap                                           |   22 +-
 .../bindings/net/wireless/qcom,ath12k.yaml         |    6 +
 .../bindings/net/wireless/qcom,qcn6432.yaml        |  149 +++
 MAINTAINERS                                        |    1 +
 drivers/net/wireless/ath/ar5523/Kconfig            |    1 -
 drivers/net/wireless/ath/ath.h                     |    2 +-
 drivers/net/wireless/ath/ath10k/core.c             |   42 +
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c     | 1137 ++------------------
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h     |  278 -----
 drivers/net/wireless/ath/ath10k/sdio.c             |   16 +-
 drivers/net/wireless/ath/ath11k/Kconfig            |    1 -
 drivers/net/wireless/ath/ath11k/wmi.c              |    3 +-
 drivers/net/wireless/ath/ath12k/Kconfig            |    2 +
 drivers/net/wireless/ath/ath12k/Makefile           |    2 +-
 drivers/net/wireless/ath/ath12k/ahb.c              |   54 +-
 drivers/net/wireless/ath/ath12k/ahb.h              |   10 +-
 drivers/net/wireless/ath/ath12k/ce.c               |    7 +-
 drivers/net/wireless/ath/ath12k/ce.h               |    6 +
 drivers/net/wireless/ath/ath12k/core.c             |   11 +-
 drivers/net/wireless/ath/ath12k/core.h             |   35 +-
 drivers/net/wireless/ath/ath12k/dp.c               |   57 +-
 drivers/net/wireless/ath/ath12k/dp.h               |    3 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h           |    3 +
 drivers/net/wireless/ath/ath12k/dp_htt.c           |   19 +-
 drivers/net/wireless/ath/ath12k/dp_htt.h           |   15 +
 drivers/net/wireless/ath/ath12k/dp_peer.c          |  186 +++-
 drivers/net/wireless/ath/ath12k/dp_peer.h          |   43 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c            |   10 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h            |   16 +-
 drivers/net/wireless/ath/ath12k/hal.c              |    6 +-
 drivers/net/wireless/ath/ath12k/hal.h              |    6 +-
 drivers/net/wireless/ath/ath12k/hif.h              |   30 +
 drivers/net/wireless/ath/ath12k/hw.h               |   30 +-
 drivers/net/wireless/ath/ath12k/mac.c              |  171 +--
 drivers/net/wireless/ath/ath12k/mhi.c              |    4 +-
 drivers/net/wireless/ath/ath12k/pci.c              |  111 +-
 drivers/net/wireless/ath/ath12k/pci.h              |   21 +-
 drivers/net/wireless/ath/ath12k/pcic.c             |  435 ++++++++
 drivers/net/wireless/ath/ath12k/pcic.h             |   24 +
 drivers/net/wireless/ath/ath12k/peer.c             |    2 -
 drivers/net/wireless/ath/ath12k/qmi.c              |  249 ++---
 drivers/net/wireless/ath/ath12k/qmi.h              |    7 +-
 drivers/net/wireless/ath/ath12k/reg.c              |    4 +
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c        |   45 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c     |    4 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  112 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |    8 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c      |   15 +-
 drivers/net/wireless/ath/ath12k/wifi7/hal.c        |    7 +
 .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    |    8 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |  101 +-
 .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.h    |    2 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |   17 +-
 .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |    6 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c         |  160 ++-
 drivers/net/wireless/ath/ath12k/wifi7/pci.c        |   22 +-
 drivers/net/wireless/ath/ath12k/wmi.c              |   50 +
 drivers/net/wireless/ath/ath12k/wmi.h              |   23 +
 drivers/net/wireless/ath/ath9k/ani.c               |    4 +-
 drivers/net/wireless/ath/ath9k/common-spectral.c   |   41 +-
 drivers/net/wireless/ath/ath9k/common-spectral.h   |   10 +-
 drivers/net/wireless/ath/ath9k/debug.c             |    3 +-
 drivers/net/wireless/ath/ath9k/eeprom.c            |   10 +-
 drivers/net/wireless/ath/ath9k/eeprom.h            |    2 +-
 drivers/net/wireless/ath/ath9k/eeprom_4k.c         |    4 +-
 drivers/net/wireless/ath/ath9k/eeprom_9287.c       |    7 +-
 drivers/net/wireless/ath/ath9k/eeprom_def.c        |    5 +-
 drivers/net/wireless/ath/ath9k/hif_usb.c           |    7 +
 drivers/net/wireless/ath/ath9k/htc_drv_debug.c     |    3 +-
 drivers/net/wireless/ath/ath9k/htc_drv_init.c      |    9 +-
 drivers/net/wireless/ath/ath9k/htc_drv_txrx.c      |   41 +-
 drivers/net/wireless/ath/ath9k/hw.c                |   46 +
 drivers/net/wireless/ath/ath9k/hw.h                |    2 +
 drivers/net/wireless/ath/ath9k/init.c              |    6 +-
 drivers/net/wireless/ath/ath9k/wmi.c               |   47 +-
 drivers/net/wireless/ath/ath9k/wmi.h               |    2 +-
 drivers/net/wireless/ath/wil6210/debugfs.c         |    2 +-
 77 files changed, 2218 insertions(+), 1850 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/qcom,qcn6432.yaml
 create mode 100644 drivers/net/wireless/ath/ath12k/pcic.c
 create mode 100644 drivers/net/wireless/ath/ath12k/pcic.h


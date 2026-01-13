Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99EED2F349
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 17:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3WDCTtPX8ZwvNdg61wmwVgZ/agZZgdp9VQEclxu8q5g=; b=RKnB08NqT7TYIMS1plKWwl5ow9
	zEp2jlhL8+mSreKwzzxZL8CRdw/dRDbIDsdm3sIs38Vs4Jce/KxZIdFMnrj+AYMo7YKoaIuSTwvdd
	CGlvuhQpjz00rCDiZqx2zGj71O7HjKOBS1kXSW3NmQ9uh7zdAvH/M5e4wX543O/1oR0dypHKrO1+S
	Ot4keueCBNyKxY+Mn8QC1t8D08jOJVTtrDZhuQkFtXXYX0PVKLcFVhmMP0T/INZKi/IcfWh7K5FnX
	XQXBZMsRu4sPqRDWLdOHuIbeTgRd81jeHtEXP84pYui7ntrpciu7ssH5Sfn6ccRjH2F4Iokqx76Al
	0hJTAv0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiHI-00000007XHv-2Lhl;
	Tue, 13 Jan 2026 17:34:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiHF-00000007XGl-2kHp
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 17:33:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DHN7Ge2531760
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 17:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3WDCTtPX8ZwvNdg61wmwVg
	Z/agZZgdp9VQEclxu8q5g=; b=haPXRqEP52EHnTIMb6QTDSdDWJVDOJ4csdx0s/
	zIf0AQdYY/lNEkeLBdHgez+ZwJGhmnonKLyuOyZfT+88pjUcYXViXISS/PnlN67h
	6Pn9FHGlALVtUqEiTiik8GWQhOhkC4a1n9ep+RPjVHtBrWQ8dDfXRL3RAN90qk+8
	KW6yOBJsEcBMXqCfJvE8+fPsItsPr0yYiVSUrBy4iRupDDiJ1BDjue4YzK2cFfwD
	woJJ+FN1mcGqn+mc8DLDcJNJ9fOyntYiGyWH8k74cXnuFk5eqESVJaEFuSXSmwn8
	rz1/vQmQeWRDaGNy0M07Bbsa1LhhdAsMMQziY0nVpSbqNZAg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8t7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 17:33:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b062c1aa44so24461539eec.0
        for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768325636; x=1768930436; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WDCTtPX8ZwvNdg61wmwVgZ/agZZgdp9VQEclxu8q5g=;
        b=dboh0nOw6dmhh+xGnON0Lq3YQDcLZACAREK7DsyLaXat/m9RyCfamlUJUIG647O6yH
         T9giwi82TPK7ySCZL++I5vseQ0URmcHqPLmGQrvk7K6E8mQVVJ88/rbc13uk9+Vkn9/Z
         DidFmd3LTsOZ6rPJJNt7P6fAWwZX6l/c/DX/DolLbq2viRuF3T/GirIoqjNg1C5SZDca
         /fDxIkdrjbr+xmoj/TY5GVetqZ16Ry6SFALM/2nWpBWdxnq2PX1eHVZifG/GLQT60cPy
         +ziRmgAbzCwnsXMOk6Hvqs5zFha3bGQpoh7j8IhFJrALaz1AesM1X/Umpfle3I8pGRhd
         +TJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768325636; x=1768930436;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3WDCTtPX8ZwvNdg61wmwVgZ/agZZgdp9VQEclxu8q5g=;
        b=j/qp5oZdv2WvHzku5pApenFYzgSJ42+l+/EWUNtFnKYqM+LiukqSgA21J0L635WJ8b
         uf+C8M6luaoysQW0+P+TC6y3hhQXayZsuAp9yzvWw5+ZrxdllfLSBwSRvhxUuC+nxlSv
         N773C1hv/T0HKftKBlmD9F58MSMBi5yznJalJUO35PVQI1BSOjrGceqbxeAnZfIuU3Jf
         DTXyEsmyQlPV392EzUtbPE+sire4XiEMVJjCWSwy9sXIlL5Mjy6QezSz2hfXKbrRz7Wt
         xL9/JbhCBiBI90aH4nYrN8HE8ODj8rtEpi7mCotwTD62fLsrU6iOks5W2FxP+CIBq30e
         vxzA==
X-Forwarded-Encrypted: i=1; AJvYcCUKgM6HGUjUAC+JSuIHc49awV/PvsM91cZUkGWQd0jluzewiw1oOR/FQ1BktNvkTmI5mTBfV5w=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDx+ovqp0zsejq5hWDO8ZtCjqeKxWcBPIHzcWEaRUSjYWRwjHY
	Fbh3wutd36HhMY1T7hKVxvNd2HnhHo0+XO5NDCnDqTl9cIpBAzK9QCT+TNNGqphnbKDuvLBxigg
	4bhOfzdVAbc3NxeE/YgeKE/cIBZmxvmEo2djrsDVn5fQrckeYiAUkTtXnWUI+SPia
X-Gm-Gg: AY/fxX4miKMjVnGUqt73J1edjgWOwIujPGuc/pumgota5VxIgn6mENY+515y1iWJk4Z
	hA6FsT7SsKxaYQlkpfxUYQIjiFd5kW3z2be85vxk02yhb7o13LByHDd8m0Is4OS5Bi5ds8O1Q3A
	jKodWJ3MyxsSbnRiadHQHNxQL/kS7E9c6+MX1hYUuYrejvTrg11yV3pL4ag7RbBosJ7f+wSEFV6
	nXIgb4Mxc2tWRKDKpJvfJLXu88Z2JgreXe3/eVDheCgQWHwsG/S48TJ0O+ipIVzQJV8pawDPPWq
	8AaEoF6Uk8DRVznkItgs7T6aKn3bUa/d3qs/6VI0cOKSl7xOsR3GRM1xVR+XR4bMCl1yRXXS3yL
	kQQFHVXB2MMx7eYPk6PYfgJ+EVb6HAHM4hWalGnR1LYzJIg==
X-Received: by 2002:a05:7300:e9ce:20b0:2b4:7971:fb66 with SMTP id 5a478bee46e88-2b47971ff25mr891144eec.41.1768325635986;
        Tue, 13 Jan 2026 09:33:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFlVV5wiowpUo2Nox6aqo/BkpUnum6WEyQXQkmPHOgyzMlaQ96MbXJbsrdZQzciQWHXFabJGA==
X-Received: by 2002:a05:7300:e9ce:20b0:2b4:7971:fb66 with SMTP id 5a478bee46e88-2b47971ff25mr891106eec.41.1768325635342;
        Tue, 13 Jan 2026 09:33:55 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b45e73b401sm1283444eec.21.2026.01.13.09.33.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 09:33:55 -0800 (PST)
Message-ID: <98386125-c0bb-495e-b2ba-2765aaed19d8@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 09:33:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260113
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Y2B9OL0IBVwCyXnLTtOts13cSIvzi_qc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0NiBTYWx0ZWRfXwQOvOWZzEvkp
 bqNuprDBnWzVXIlWB3GvtWW31piSVHIY4+btoi87dl/bj2Vwk7VLqtoRJbaL0c44fv/1f2r8NfD
 zChZ3/IqX4HYsncHxXxOMS1IgnJ7qQS6LNFPPBvr4P7spxPpf5Jve67+4FNpDgwZgzJOOIiI0lp
 8yh81+/wP4n/Cmuj53EqHaTOaFJmebjCVcnP6RLNf2oUpZFf+pYaduTz9+iOgYVejfoNsSRYpAE
 DTF2Tov+Wxiuld5ykF5tl3CtXYNdIxTwo0vvwXgpOQchWECwNngQ1Tc/HqY2ySsx1GA0gL3jH6l
 fPxIJJfMiTyehyuU0IN2AQbIiiA4d7ap31DCU9hj9U+AjmbkWNoC1eHlaqHWB2wNDKuA19adpzJ
 DNYDVZZv80YFLsW1k+L9NXp/4MPRnzMfo4kweYPY4jxLV5r9U2uZyBixza8z/5JYlmyrvxUOFmW
 rQU7WNWiaOiyP65aaXA==
X-Proofpoint-ORIG-GUID: Y2B9OL0IBVwCyXnLTtOts13cSIvzi_qc
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=69668204 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=jiOn_W3BcUuOKtM18IsA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_093357_706749_F120C647 
X-CRM114-Status: GOOD (  11.99  )
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

The following changes since commit a203dbeeca15a9b924f0d51f510921f4bae96801:

  wifi: mac80211: collect station statistics earlier when disconnect (2026-01-08 13:33:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260113

for you to fetch changes up to 31707572108da55a005e7fed32cc3869c16b7c16:

  wifi: ath12k: Fix wrong P2P device link id issue (2026-01-13 07:25:02 -0800)

----------------------------------------------------------------
ath.git update for v6.19-rc6

A collection of small bug fixes in ath10k and ath12k.

Note to maintainers:

This tag includes:
31707572108d ("wifi: ath12k: Fix wrong P2P device link id issue")

That commit contains the following:

Note to linux-next and netdev maintainers:

This patch going through the "current" tree conflicts with
the following going through the "next" tree:
commit 631ee338f04d ("Merge branch 'ath12k-ng' into ath-next")

The conflict resolution is to leave the following file unmodified:
drivers/net/wireless/ath/ath12k/mac.

And to apply the following patch to ath12k_wifi7_mac_op_tx()
in the file drivers/net/wireless/ath/ath12k/wifi7/hw.c -705,7 +705,10

 			return;
 		}
 	} else {
-		link_id = 0;
+		if (vif->type == NL80211_IFTYPE_P2P_DEVICE)
+			link_id = ATH12K_FIRST_SCAN_LINK;
+		else
+			link_id = 0;
 	}

 	arvif = rcu_dereference(ahvif->link[link_id]);

----------------------------------------------------------------
Baochen Qiang (2):
      wifi: ath12k: don't force radio frequency check in freq_to_idx()
      wifi: ath12k: fix dead lock while flushing management frames

Manish Dharanenthiran (1):
      wifi: ath12k: cancel scan only on active scan vdev

Thomas Fourier (2):
      wifi: ath10k: fix dma_free_coherent() pointer
      wifi: ath12k: fix dma_free_coherent() pointer

Yingying Tang (2):
      wifi: ath12k: Fix scan state stuck in ABORTING after cancel_remain_on_channel
      wifi: ath12k: Fix wrong P2P device link id issue

 drivers/net/wireless/ath/ath10k/ce.c  | 16 ++++++++--------
 drivers/net/wireless/ath/ath12k/ce.c  | 12 ++++++------
 drivers/net/wireless/ath/ath12k/mac.c | 16 ++++++++++------
 drivers/net/wireless/ath/ath12k/wmi.c |  9 +--------
 4 files changed, 25 insertions(+), 28 deletions(-)


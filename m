Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB4ECD8CAA
	for <ath12k@archiver.kernel.org>; Tue,  9 Jun 2026 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yh/qlCI4RSGheI4VM0m2qKRN3/NEqC81qg+NEzqwGBc=; b=g6SW3VRW6shFBqZ40E6CoyHkp5
	mMwSXaNeoRVOW4VxJN50ol+mYOcB1nSqXTfF8HjJtgmzV6nlicGySzimtYFIZqEGkKPwSH5AYTVm6
	7DVIn2vyNL+pHbsNo20dqCPKoO8stTLr66bVqsdoMrZc8pyw/IlKntn9zn6tvYbuUhGVtIKd2CG9F
	d0vYNpLJFCHzyBSyvVf0kyLnPL8u/JM37glqlxJ0az4aFswkxFPYN+zbjs6Iuj/lmEoel5yP+bcCA
	pzdtISc6cPhlac6iDfwN3tMOlHyPrYMAV+cJcMm3TRpxmbaQRVyNjS3CE82FNJnbwm5pWudplmKk2
	6/BjjuHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxaJ-00000005nCR-3m89;
	Tue, 09 Jun 2026 14:37:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxaG-00000005nBK-47sM
	for ath12k@lists.infradead.org;
	Tue, 09 Jun 2026 14:37:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmgQL2700856
	for <ath12k@lists.infradead.org>; Tue, 9 Jun 2026 14:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Yh/qlCI4RSGheI4VM0m2qK
	RN3/NEqC81qg+NEzqwGBc=; b=ZfgrAb5g3zWFsoWEFyoYMCvs/vrkIJKHzECsPc
	tx19/cWZ3vzIZBdzaZFGze2cCrRcmEsWW+7QjJHQ8HgGZzLBSYg3Q3jl//b4mn4H
	pbm5cy/FWBZso6kVYKtQUu2jSsdKzi1VHXo9BTINYJnj1NLEpUQDYKPGaDhRT2Rf
	djnFcnLKbkclj+KxREWnriJxCUsVzWom8AWBP2cyhmy81sL4uQcUn3T0bCmHZc3Y
	lbtz6NAcxC9dq99N47mFBQhir85pv9tlsmioV/BAKDsT5qWmRnHsNFkue7fHBETc
	Hz4W2Mcc1jxgImldhcP6IEiiO3NY73ItlxGUVwbZqqv6+mEw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeasx4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 14:37:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-304b8d0ee63so7779299eec.0
        for <ath12k@lists.infradead.org>; Tue, 09 Jun 2026 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781015859; x=1781620659; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yh/qlCI4RSGheI4VM0m2qKRN3/NEqC81qg+NEzqwGBc=;
        b=HvDFLcXbrxqKrjWnqkymbDVvgBAre9GK861Cqf90Z1pNeYcfaYvHVO5eyW+G2BVTqP
         bP6Y7Dge/88P6JdToo2/n8HgTLEbzrFdSKw07Qf+4BalyYnO0iwm14Nq3siwkDj7tVZo
         OuSOPIZJlDnSw2u4bZ2jYUsYK9vxs3jf0zmpinOXCXHv0XGhBmN/H5s9ykjTaqS645JY
         n6SvsIEsN6rh+wBCnLFEP0A5gzt6pfc1xQWtrG55y9WOiV7VSjenIEb9BDfUsj3doatE
         k3s+fGOMDrgPENwaxxaSFm3betycJD7utCpH40I6GqszQfvzPfHvO25eVvt1bcqlxPGg
         wF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015859; x=1781620659;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yh/qlCI4RSGheI4VM0m2qKRN3/NEqC81qg+NEzqwGBc=;
        b=gwBKoupNPJMJ46ELBnL9Qmj+suXlNqxvo16cMwNIBmR+VroiZkv3Egb297uncy5tA3
         z5ElJ+Mj9T9Q29luRQHmhs8Zb7f3nY0Hm6nD8fYCgDSFc+wDS6ZgZfd03kN+wpXoAMjD
         ebUY8n2G2PB0X8r1mleUn60qCX2YLkGf4OYgcKtvLDl6mbwIFyij6+BAs3wUpccnsJ+1
         026HbIyO1+NBEgQpRSZZN51C8QWcausApMhlg7ZEEPrwy70IW1TI2gKkUirIojmhRk6k
         g3y2NSyf9ymy5PltQPt9x4ejduLf3nBBUO2MBwRvTqHZxwQQbEJyBdVCgy7S0+8cPpge
         64sA==
X-Forwarded-Encrypted: i=1; AFNElJ9l1irB1MeA7bqA1J1bnpauhF7q+A0P/3xP5I6i0FXMCVnUzhXXlvApl1OrXYfEkbh3yOflhw4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwjptetk3FNSowwrhsogIpfonE/oVQGXLKXlPstDgu3sxvm21a
	s3k+n5af7IoXqVQEMotmbW6eE6qpy7PLo+UjrSeeCDrVzq9aTxmGODHi3X0FqnZDF7czcefOmvk
	JZGXOljLboZMrKbcQ5kyYRgbVDdKNvmlxbBCO3/lyWMCkL3yp271dsyFdjxPVycIv
X-Gm-Gg: Acq92OHlx3wdlauUUxlUbX343cw2zEfwhEAvP4TMoXFBOGb00J6yXaO0omYERQUeUiq
	Rn5LTCGB0x6u2/Ylh5nClxCIQTf/TihCnjcSPz+8hmPvFWNKAMcxmzckx4Z6i7eVtmRMxEVthjB
	vVPOlvmQZs+Zx7KVq1HOGQ5bIAzPGLyJ6lQbpaCyGvhV4SJZgpOaKjUxLdscIoX6R2LNdcBdf8Q
	jo7v4Ytne0C4GfllrEWwkZsnKacYcRnKQTqNPmyj8DWaKEcctIX3YNHDZChlwlLiM4baDpG1y7u
	S396Xq7MxXY93xRt1oZmaTEAkI98/xWyXRfabtdkZtt38AEicYDt9ZZfNZXNjGybjeOrkiKqif9
	Blf8rAd3OVekqi+tNxPI9cYkZLV3X/ZGHQJk7SGVme8Z6WHxLj1iPlBJ7S2Dr/rLpyp52
X-Received: by 2002:a05:693c:37c3:b0:304:de94:1c55 with SMTP id 5a478bee46e88-3077b38e7e4mr14417791eec.35.1781015858619;
        Tue, 09 Jun 2026 07:37:38 -0700 (PDT)
X-Received: by 2002:a05:693c:37c3:b0:304:de94:1c55 with SMTP id 5a478bee46e88-3077b38e7e4mr14417728eec.35.1781015857847;
        Tue, 09 Jun 2026 07:37:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db85f60sm26513545eec.8.2026.06.09.07.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:37:37 -0700 (PDT)
Message-ID: <a90fba3c-c4c1-470f-b5fa-5cf1fee17163@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 07:37:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-next-20260609
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TED13XNtA-FsS4hprTZEoI2CIwXt0gcX
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a282533 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=Of_zAPQQtSp_xK_LWJsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzOSBTYWx0ZWRfXyK9l/eReu+l4
 81EYh/F5A3j2GS4gomObqeLU2b/qSUFSl5/xAOSa60pWvWI2sjl+pERfUTJQDHul/ldJj0kHNDV
 u3v4l9V7qdFfbebG3UHO7EL05yrZvTkMqlVNr103qVzUC0o/3YyjFMqSpS/o38vI2ItPMfkFS77
 5MpB4LcwyTEZwpLXZy9CuOkpj5rcH1Y5FdVulTx+ZnMTzU3lq+ZCVQgW6nE+2t+cNwxuwCZhRM3
 +7qL14uGnPkhzGKbUgO9DVKnCmtvQj36V5Hmd+i0Y0DpalyzXzuUI+6em0tdNIie+H/DGkpTuQZ
 3C9YJN1Jg2BbE24V7TvmzwPRbc+h3vlLiVXcTW7HEOX1w8Hlnt/skdoWoSwA98DVYL3y1kLzQaK
 gAhMy/ijdcU71PXWKlOJGa+F0DoU1PvNCYj+YAZy0y7RokyHXza7jhy0OEOsqZwZmbu2YH3R8VR
 zpahkIp6k6/4ag8XXJg==
X-Proofpoint-GUID: TED13XNtA-FsS4hprTZEoI2CIwXt0gcX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073741_138875_8697351D 
X-CRM114-Status: UNSURE (   9.00  )
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

The following changes since commit a26c2a22e7e88b2b5afb1349f3994fc564c988b1:

  Merge tag 'iwlwifi-next-2026-06-03' of https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next (2026-06-04 13:22:11 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20260609

for you to fetch changes up to 63abe299b12b317dfee5bcd09037da4668a4431a:

  wifi: ath12k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported (2026-06-09 06:50:29 -0700)

----------------------------------------------------------------
ath.git patches for v7.2 (PR #4)

An assortment of cleanups and minor bug fixes across wcn36xx, ath9k,
ath10k, ath11k, and ath12k.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: fix EAPOL TX failure caused by stale tcl_metadata bits

Jeff Johnson (4):
      wifi: ath12k: Update Qualcomm copyrights
      wifi: ath11k: Update Qualcomm copyrights
      wifi: ath10k: Update Qualcomm copyrights
      wifi: ath: Update copyright in testmode_i.h

Rosen Penev (6):
      wifi: wcn36xx: allocate chan_surveys with main struct
      wifi: ath9k_htc: use module_usb_driver
      wifi: ath9k: Clear DMA descriptors without memset
      wifi: ath9k: remove TX99 power array zero init
      wifi: ath9k: remove disabling of bands
      wifi: ath9k_htc: allocate tx_buf and buf together

Stepan Ionichev (1):
      wifi: wcn36xx: fix spelling mistakes in dxe header comment

Tristan Madani (3):
      wifi: wcn36xx: fix heap overflow from oversized firmware HAL response
      wifi: wcn36xx: fix OOB read from firmware count in PRINT_REG_INFO indication
      wifi: wcn36xx: fix OOB read from short trigger BA firmware response

Wen Gong (1):
      wifi: ath12k: enable IEEE80211_VHT_EXT_NSS_BW_CAPABLE when NSS ratio is reported

 drivers/net/wireless/ath/ath10k/bmi.c              |  1 -
 drivers/net/wireless/ath/ath10k/ce.c               |  1 -
 drivers/net/wireless/ath/ath10k/coredump.c         |  1 -
 drivers/net/wireless/ath/ath10k/coredump.h         |  2 +-
 drivers/net/wireless/ath/ath10k/debug.c            |  1 -
 drivers/net/wireless/ath/ath10k/debugfs_sta.c      |  1 -
 drivers/net/wireless/ath/ath10k/htc.c              |  1 -
 drivers/net/wireless/ath/ath10k/htt.c              |  2 +-
 drivers/net/wireless/ath/ath10k/htt.h              |  2 +-
 drivers/net/wireless/ath/ath10k/htt_rx.c           |  1 -
 drivers/net/wireless/ath/ath10k/htt_tx.c           |  1 -
 drivers/net/wireless/ath/ath10k/hw.c               |  2 +-
 drivers/net/wireless/ath/ath10k/hw.h               |  2 +-
 drivers/net/wireless/ath/ath10k/pci.c              |  1 -
 drivers/net/wireless/ath/ath10k/pci.h              |  2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c     |  2 +-
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h     |  2 +-
 drivers/net/wireless/ath/ath10k/rx_desc.h          |  2 +-
 drivers/net/wireless/ath/ath10k/sdio.c             |  2 +-
 drivers/net/wireless/ath/ath10k/thermal.c          |  2 +-
 drivers/net/wireless/ath/ath10k/usb.h              |  2 +-
 drivers/net/wireless/ath/ath10k/wmi-tlv.h          |  2 +-
 drivers/net/wireless/ath/ath10k/wow.c              |  2 +-
 drivers/net/wireless/ath/ath11k/ahb.c              |  2 +-
 drivers/net/wireless/ath/ath11k/ahb.h              |  2 +-
 drivers/net/wireless/ath/ath11k/ce.c               |  1 -
 drivers/net/wireless/ath/ath11k/ce.h               |  2 +-
 drivers/net/wireless/ath/ath11k/coredump.c         |  1 -
 drivers/net/wireless/ath/ath11k/coredump.h         |  2 +-
 drivers/net/wireless/ath/ath11k/debug.c            |  1 -
 drivers/net/wireless/ath/ath11k/debugfs.c          |  1 -
 drivers/net/wireless/ath/ath11k/debugfs.h          |  2 +-
 .../net/wireless/ath/ath11k/debugfs_htt_stats.c    |  1 -
 .../net/wireless/ath/ath11k/debugfs_htt_stats.h    |  2 +-
 drivers/net/wireless/ath/ath11k/debugfs_sta.h      |  2 +-
 drivers/net/wireless/ath/ath11k/dp.c               |  1 -
 drivers/net/wireless/ath/ath11k/dp.h               |  2 +-
 drivers/net/wireless/ath/ath11k/dp_rx.h            |  2 +-
 drivers/net/wireless/ath/ath11k/dp_tx.c            |  1 -
 drivers/net/wireless/ath/ath11k/dp_tx.h            |  2 +-
 drivers/net/wireless/ath/ath11k/fw.c               |  1 -
 drivers/net/wireless/ath/ath11k/fw.h               |  2 +-
 drivers/net/wireless/ath/ath11k/hal_desc.h         |  2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.c           |  2 +-
 drivers/net/wireless/ath/ath11k/hal_rx.h           |  2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.c           |  2 +-
 drivers/net/wireless/ath/ath11k/hal_tx.h           |  2 +-
 drivers/net/wireless/ath/ath11k/hif.h              |  2 +-
 drivers/net/wireless/ath/ath11k/htc.c              |  2 +-
 drivers/net/wireless/ath/ath11k/htc.h              |  2 +-
 drivers/net/wireless/ath/ath11k/hw.c               |  2 +-
 drivers/net/wireless/ath/ath11k/mac.h              |  2 +-
 drivers/net/wireless/ath/ath11k/mhi.h              |  2 +-
 drivers/net/wireless/ath/ath11k/p2p.c              |  2 +-
 drivers/net/wireless/ath/ath11k/p2p.h              |  2 +-
 drivers/net/wireless/ath/ath11k/pcic.c             |  1 -
 drivers/net/wireless/ath/ath11k/pcic.h             |  2 +-
 drivers/net/wireless/ath/ath11k/peer.c             |  2 +-
 drivers/net/wireless/ath/ath11k/peer.h             |  2 +-
 drivers/net/wireless/ath/ath11k/qmi.h              |  2 +-
 drivers/net/wireless/ath/ath11k/reg.h              |  2 +-
 drivers/net/wireless/ath/ath11k/rx_desc.h          |  2 +-
 drivers/net/wireless/ath/ath11k/spectral.c         |  1 -
 drivers/net/wireless/ath/ath11k/spectral.h         |  2 +-
 drivers/net/wireless/ath/ath11k/testmode.c         |  2 +-
 drivers/net/wireless/ath/ath11k/testmode.h         |  2 +-
 drivers/net/wireless/ath/ath11k/thermal.c          |  2 +-
 drivers/net/wireless/ath/ath11k/thermal.h          |  2 +-
 drivers/net/wireless/ath/ath11k/trace.h            |  2 +-
 drivers/net/wireless/ath/ath11k/wow.c              |  2 +-
 drivers/net/wireless/ath/ath11k/wow.h              |  2 +-
 drivers/net/wireless/ath/ath12k/acpi.c             |  2 +-
 drivers/net/wireless/ath/ath12k/acpi.h             |  2 +-
 drivers/net/wireless/ath/ath12k/coredump.c         |  2 +-
 drivers/net/wireless/ath/ath12k/coredump.h         |  2 +-
 drivers/net/wireless/ath/ath12k/dbring.h           |  2 +-
 drivers/net/wireless/ath/ath12k/debug.h            |  2 +-
 drivers/net/wireless/ath/ath12k/debugfs.h          |  2 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.h      |  2 +-
 drivers/net/wireless/ath/ath12k/dp.c               | 10 ++++-----
 drivers/net/wireless/ath/ath12k/hif.h              |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c              |  4 ++++
 drivers/net/wireless/ath/ath12k/p2p.c              |  1 -
 drivers/net/wireless/ath/ath12k/p2p.h              |  2 +-
 drivers/net/wireless/ath/ath12k/reg.c              |  2 +-
 drivers/net/wireless/ath/ath12k/reg.h              |  2 +-
 drivers/net/wireless/ath/ath12k/testmode.h         |  2 +-
 drivers/net/wireless/ath/ath12k/trace.c            |  2 +-
 drivers/net/wireless/ath/ath12k/trace.h            |  2 +-
 drivers/net/wireless/ath/ath12k/wow.h              |  2 +-
 drivers/net/wireless/ath/ath9k/ar9002_mac.c        | 15 +++++++++++++-
 drivers/net/wireless/ath/ath9k/ar9003_mac.c        | 23 +++++++++++++++++----
 drivers/net/wireless/ath/ath9k/ar9003_phy.c        |  4 ++--
 drivers/net/wireless/ath/ath9k/hif_usb.c           | 24 +++-------------------
 drivers/net/wireless/ath/ath9k/hif_usb.h           |  4 +---
 drivers/net/wireless/ath/ath9k/htc_drv_init.c      | 18 ----------------
 drivers/net/wireless/ath/ath9k/hw.c                | 16 ++++-----------
 drivers/net/wireless/ath/ath9k/hw.h                |  2 --
 drivers/net/wireless/ath/testmode_i.h              |  2 +-
 drivers/net/wireless/ath/wcn36xx/dxe.c             |  4 ++--
 drivers/net/wireless/ath/wcn36xx/main.c            | 13 ++----------
 drivers/net/wireless/ath/wcn36xx/smd.c             | 13 ++++++++++++
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h         |  2 +-
 103 files changed, 139 insertions(+), 171 deletions(-)


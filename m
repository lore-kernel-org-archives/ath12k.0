Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C05CA600B
	for <ath12k@archiver.kernel.org>; Thu,  8 Oct 2026 13:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0W0B5pjteSWh4hsWqWFhjgpgfLReXZGt1ZYOhHI9OnI=; b=KaERozsptfY0HV
	p7zgLV7ssLREOuV0qEeCRY4S26S30hdsbQ6VUDjo6+3qFnQwJfkgEH5MXOD6A5WQhY0qb1zrbzNHy
	p4EU96rfPssyjzMsRoby+qJiWNpMg8jPD8YuqVCiqlphsTXTVehxXKq3ZxF+2ZesO7S4mS9xXBNlC
	3+tiNqCcmnWvPiyPCxUPB0SdG2KrVSwBHZ2WMuXxhrPssumDF/w8fHSslrUjjgOCvqQPPO9wTJHCK
	Br0AJsEXPhnmRXXw0Nw1kx42tlK0rV56QjYstmxEbvbLmuJkgl4sEh01ao4n5IIfCyJsn6YdiX+N6
	sXbOo3qmnoAr2pqEVxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnz0-00000004Qao-2pNp;
	Thu, 08 Oct 2026 13:16:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEnyx-00000004QZn-47cK
	for ath12k@lists.infradead.org;
	Thu, 08 Oct 2026 13:16:25 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698CXLe32763173
	for <ath12k@lists.infradead.org>; Thu, 8 Oct 2026 13:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0W0B5pjteSWh4hsWqWFhjg
	pgfLReXZGt1ZYOhHI9OnI=; b=HafsB/3JMPCGW+Tzlfs628q0Dy4DoBW/908kGB
	xHU1t+aBrk/R162UKEzROVSPKTBsFhbA0fOStXuyQThhALcXXquaYDWBNpPWvNoN
	sou3lPyBCNBsmqYzej4au3lggz91YWdeWycCsf/J2vz5E0fknWi8hnfZMFubGuRw
	XODvGjxq8snVoYliO8T7mvMnx2RyP+jqW6E48nHazGQhK6Xu23wz5WFNNpUDwCSD
	b+BXwwpkSMCTbLkTwJNFvTWQJjgYShKvzz/bNZy9dre9FjtwtZCQUyIzCr/diDmO
	oMS3njgijEm3VDczNDOzdbdrvlMv/e5t4MBQOVU+cKjkFFoA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kg56x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 13:16:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso972632285a.3
        for <ath12k@lists.infradead.org>; Thu, 08 Oct 2026 06:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791465381; x=1792070181; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0W0B5pjteSWh4hsWqWFhjgpgfLReXZGt1ZYOhHI9OnI=;
        b=Y71dWQYw5LO8jDWpMP3JgIdFZov9OPHjxF7J4HujX88nX2kBctzYLm6mEAa5LAsOGs
         lLkJaPGWBkUhTKpUEQOuwiCH7dbA1NTTztiFmRCD5QcPGkNeAbjPrZP5I+050UUi3W1p
         Xt9mEwvPkD4aYxhRp103ow6FZe19LSMUNqJ1MCHcQp8OWI3usGEloEmVZ2w2sMqJAX2w
         qCmi7vYSiFNFyrwx81BcWuUPTFqa1dySoTCV1+zzG3bVo5nCgLxxHOCZUgD4/iw60SMV
         TAJpP1ZvnkR2f08zlwbe/FwsmhA8aMW4gk7OYAxXyB4ANENOpKIFxG2X1ADr6DKnuxBR
         L1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465381; x=1792070181;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0W0B5pjteSWh4hsWqWFhjgpgfLReXZGt1ZYOhHI9OnI=;
        b=1Z7iQLHB96nQ2TaFao4SGmYO5/PMJr9lBGCeIgoFuyDorkPAeKYE0+LfJEgLxoZbfR
         VNuEyldqz8LXlqGkUe9aWXyN5s4GNr2QwBBx6zKq0DL6oVlwDqtFdV8ekqkj1y/7VDsV
         ptf0tzxLFvNXgjbVJeqVpNQhEOQyybu/PLmS8BYDa2zMyGgo/X/wv1k4jvLVTW9pAPMC
         JzJ5x+izxZ0mZqC3UWOKZSOlPHogsNaTFzN52UXJT6JYtSVNC346vcTQ5UR6P1cIDh4F
         gOTr8fLquWAoGq4ekDiOJ2+o9v4VsXWoNGWmdeuiaKPnCYZ84G2SWL1BeeI7rYzOrYXx
         msNg==
X-Forwarded-Encrypted: i=1; AKwUvBzCIRjfmXErDi9yUEq0fm/YMs+V64qqGfsttlrsSzlzpL1qGSudOKR2GQF1mplMUPyZB1z24IE=@lists.infradead.org
X-Gm-Message-State: AFuF++kJewe1swe1QVC3MTjL8aD4X3Ghakm+IC82WfZm4nOwL2keFFG0
	6dyx/nCINU6WP0TEdsU4IsUMUH68u2Hjbk9T1UU2yTZ8ajQ41duwvcwGACRaSy7NTaOO7np34Kp
	RBxNfbqdbrnKlnzYA/ZEUzcC3KnN/+2ZtO42Xflc7E7XpSBemOVwViajw7tXfLCpa
X-Gm-Gg: AYBFou0PmHdQQysJcglZ8R+IiBtjnavhPbPPXbrXA9YySW20Fo07p/03hZzreiyaXE7
	ogYszAIs/8ktQ9miaBj+42sWEa2JxeDpvXXlf9ArOfVY0gbRNcG4hi5ACp9CtphnKXBorRmpsZ3
	WGFDf1O/W5daMKGVixBVbt6zqmcg3YcNKRJM1ZqMrMo+7QhTHwSP8jlm0CVwQq2pme77OuTxNWl
	cXUs76e3GkgDqtFEJ4uvOQqK5pzi0NDQQyLUIjw4ZDS/24wqjyAfwTA3CFDZeZa7h6UwrynLySk
	J0AI68F2NG6SPZwiKCWQPGC6kudNcE+h0s2h8axHlDr3R3wJhYVVLEZb/+WGuUqMxFVdIRm3F6R
	cL/H59KoYNTesSA==
X-Received: by 2002:a05:620a:2844:b0:93c:612e:9b57 with SMTP id af79cd13be357-93e9b84f3a4mr1029125685a.56.1791465380813;
        Thu, 08 Oct 2026 06:16:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:93c:612e:9b57 with SMTP id af79cd13be357-93e9b84f3a4mr1029118185a.56.1791465380154;
        Thu, 08 Oct 2026 06:16:20 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843e8c41sm63155195e9.15.2026.10.08.06.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:16:19 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Subject: [PATCH 0/3] wifi: ath12k: add page_pool support for rx data path
Date: Thu, 08 Oct 2026 15:15:57 +0200
Message-Id: <20261008-ath12k-pp-v1-0-68f888cd7eec@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwNz3cSSDEOjbN2CAt1Ui2QzoyRTkxRzUzMloPqCotS0zAqwWdGxtbU
 ACasDnlsAAAA=
X-Change-ID: 20261007-ath12k-pp-e8c62b54d756
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: p6XzXoJwK8ilONlbyMpTYZ4qsxZnFtWc
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac797a5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RaDjGGdyF9MjWTccV1AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfXwESooadXzsXp
 M1v637rx1fcy3hCVF05iULSSbF6Au0I4+M6lAIwboyrsnP5crOAo/dc4zklccYIVCwYhIHbnPGZ
 SXsgXjxM+8KXQuWl3fd1tPhrFlmK/hU=
X-Proofpoint-GUID: p6XzXoJwK8ilONlbyMpTYZ4qsxZnFtWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1MiBTYWx0ZWRfX9HcnXBOAhOfb
 UFiiRYyWq/4izu+l4c/VgUEMgNwKc6jbCnoNaHWdv/07Kg/rMhU7GCqr0vwsaBMRlg0re2oSlk/
 AVeoCVFsSmQyo2fyxfUOk8e/qSyTwKZDrB5YQErpHEtAvy+GQksyiyVeAhJHHefVItCaXE+M/6C
 OUWaqmZLvXLJqvV9FfgjuT0geJzXSTL4wFfwdAfR7GESxYO4e4IUEjjgMp4v/AJ3buZ7K4K07JY
 k5Ilk1u43BaWW0YV17gINr3BavOlZcs7JN7BHk7yB0WtQWbR0r2NhC7Kuxg0K2ZHev1XM9bk9IT
 pEvfYQSVJ5Lh/DTJVRRSNSPgjOj2hOH64zEpcdZ+VXmJDBsGOSqV6DB2i5yBdJyA1b+t+dDppAp
 ycLVmAokTt+3DAOyrnTwWwnx9w8uayoB2UMHjPkmswu+jxD3CNbFuET2dH1q2D5TafNIbUKosOL
 TaKMd+9HXPH+dt9CZgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1011 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_061624_141741_FFB84497 
X-CRM114-Status: UNSURE (   8.64  )
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

Convert the Rx refill buffers to the page_pool API instead of allocating
an skb with dev_alloc_skb() and mapping it with dma_map_single().
Fix DMA direction for reinjeced packets.

---
Lorenzo Bianconi (3):
      wifi: ath12k: fix datapath lookup in ath12k_wifi7_dp_rx_process_err()
      wifi: ath12k: fix DMA direction for re-injected Rx buffers
      wifi: ath12k: rely on page_pool APIs for buffer allocation

 drivers/net/wireless/ath/ath12k/Kconfig        |   1 +
 drivers/net/wireless/ath/ath12k/core.h         |   1 +
 drivers/net/wireless/ath/ath12k/dp.c           |   5 +-
 drivers/net/wireless/ath/ath12k/dp.h           |   1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c        | 101 +++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/dp_rx.h        |  29 +++++++
 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c |   5 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c  |  67 ++++++++--------
 8 files changed, 138 insertions(+), 72 deletions(-)
---
base-commit: 17e4b9ea527b6c9491bed60f646bb2eff7d8db7b
change-id: 20261007-ath12k-pp-e8c62b54d756

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22494CCF9EA
	for <ath12k@archiver.kernel.org>; Mon, 27 Oct 2025 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hu24l8t8X8f/xJJ8OqbvDIHaP5xTZrki9rKkEnx7h5o=; b=4N9kjTsGiiz1mR0HBCE1D99XKJ
	ehJxiGC60MT+mTfEVIocIhCcFSRuKVSk9N/nIWgAM2qTFg3TBugSA79MQQTwBY19Y/s+lAK3T2Szi
	s0DuP6T1WrDXVYl2ZtSB1X+6vbAKpB9nw333z6TdH+mau9Jan/NyZal28F3aAm+XsydWw5lm9iaCW
	jsa3Ck965pY+MT/ccxb6TKwSaryxqJT2BGemqpqszthXjB5XNJCMG7jgn4MytFhItSDM2XfCxvGoM
	haztItyHeogNZoydeKd42bPu/OcqtnYhLGj7doEocQWzCgIO511LrjOZl5TRsO/tb0GZ9Vpc5rGpv
	E/ZiY1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNpM-0000000E6fH-3fyV;
	Mon, 27 Oct 2025 14:04:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNpK-0000000E6eo-48ZX
	for ath12k@lists.infradead.org;
	Mon, 27 Oct 2025 14:04:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59R9kRGo1502912
	for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 14:04:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hu24l8t8X8f/xJJ8OqbvDIHaP5xTZrki9rKkEnx7h5o=; b=Op1+Q5kZjHd+4sar
	Hj/ViJYFgGJ3GZN+kL0EfzO0+q5NMQo5NPSr4lOCuOJwz9ZMBM3THcX5D9cH49RR
	/zCdrLqDWZzRBKBrziM7o9/v0Z1MT9UE82F1aod6wpro13Iq/B10zqJDKsdEz569
	ATLZs+g4NFfXdtlsmuiDwYWFJnMvX/lHKiKY2E63GXbPP2G7TP4PKB9jgSYoKaCj
	6qb1QdukswguwmmApRnwMCu/tjm+hgMz02lyzAzeT215PP4ZD4oZQgVDxEtNQNNe
	6Gyw6KSp34L1xcG6mty34sX5JGrGhEC4NP8QDQXKbrtFXYjsQT+JMTA3ysqcWi2H
	aUYB0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a20pnsqte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 14:04:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33baef12edaso4362209a91.0
        for <ath12k@lists.infradead.org>; Mon, 27 Oct 2025 07:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761573840; x=1762178640;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hu24l8t8X8f/xJJ8OqbvDIHaP5xTZrki9rKkEnx7h5o=;
        b=mBTsKyyVDx5xuGS/lkbBctPy9/9Oaujo5FDRcw2LGDziIMfQbbWmbkFjDTpyuE6oFq
         50txSDsiECwijnKPPMZZgOTsbQ0J0xUzwCGbGc5G3NKsxF7z5JoF3518usS2BoOOpmk0
         QXP03t2edrDjSLHz2nJQJLjRzADBNDz4ZeBV5noyP0c5Ty4NasD0qwVKTlSaxOxVAP/8
         jmz/J8cqX82IsDKqKVMBGj9F8APSakld+I3U/EDGee7vCAgBQh922gCRwOgLqSu23mcs
         4Cm5qUGZ3/9lXzL8IUcOzeA2zC64bATxuiLCelYPo6aWHRcCBj0mHkbRGI/mx4D3HpVU
         vO2A==
X-Gm-Message-State: AOJu0YwzSvI53sGTb1ZO05TD2+N6XhIIT6UYf07EHRAQTZMSfnQi0qTv
	r5cKVhBfObtwbzUF++DVKvjGUXKDh/FdEYLxUPxUsnRJBUQwHDdlsSsqHv9v+gnW7h5CavY9vcy
	zmSQK0ibkDPe4+b79dIwXQfLRm6FB6s7T2nMLC61/yPOe6EdCSE/+PdKw0UdtPKYq
X-Gm-Gg: ASbGncui+nTP3yWACrBRrIyKedJy1Mp5cTFh4yjF1n/1wvIq5vXYBqa/eHeG81tWJmn
	2M/tsjPufIkJsxPDePP6e4kh13IHZvM0z9I6eW0+FpiKeU4YmxK2voWfpSmlpVRP4DMLZ/lzeKe
	6IhqlDI3+FFiCGMCXCA+18TwRg41JGMi0JNwbOmd0shkG+wr9ZDHpdTdf2immdHGrKBBDQMfqNI
	SEHihVoSVqzB0ixMXiLrm9+cvIBd1VeIJNGbmiI6nkd7ETe2K9bGi9gi3mhKUioTIyXWXKmGctm
	/NrkQZSn2zdNMHA1sq5GNrJR4ZlDEJ2Zr7BGPF7l6nUtAQKHICGGNGXfsDmbjRzcL3TF9HalbMU
	Lbg06SKzJTn03ecvygRQouELiut92Hr2W8KY=
X-Received: by 2002:a17:90b:3fc5:b0:33e:2d0f:479c with SMTP id 98e67ed59e1d1-33fd66b42dbmr13564752a91.22.1761573839961;
        Mon, 27 Oct 2025 07:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVrhYFLGJrFEFxAjB79L3hU/gm394qy1xmuPF7hMFnkJhfGT7xIHgo7Bqqbr4CEcmUrFRhHA==
X-Received: by 2002:a17:90b:3fc5:b0:33e:2d0f:479c with SMTP id 98e67ed59e1d1-33fd66b42dbmr13564699a91.22.1761573839160;
        Mon, 27 Oct 2025 07:03:59 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f3aeesm8620313a91.14.2025.10.27.07.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:03:57 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251024181548.3255166-1-quic_rdeuri@quicinc.com>
References: <20251024181548.3255166-1-quic_rdeuri@quicinc.com>
Subject: Re: [PATCH ath12k-ng 0/9] wifi: ath12k: Modularization of peer
 object
Message-Id: <176157383748.213109.7770176959041227936.b4-ty@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 07:03:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Wc7F3TZ1ADkhvRwtdrd5bP-cSiLPgMvU
X-Proofpoint-ORIG-GUID: Wc7F3TZ1ADkhvRwtdrd5bP-cSiLPgMvU
X-Authority-Analysis: v=2.4 cv=A+xh/qWG c=1 sm=1 tr=0 ts=68ff7bd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xMiiiAbsooRf6sH7C_0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDEzMSBTYWx0ZWRfXwEAnSjxlC6cZ
 3qaQ1v/LLECOa7bkn72IypehOQFDWfuXh7opNJ48+6ndqLsDSPMqsj2n0ghrhjdXBIqtFmRA80p
 dk1f0Ya8e93QtiU6T/PJBAQLQQhOI1reafpC7Qo8rU19v3vJeAsLrVxv94nSonrfvITxBvcSmu7
 0tTjKLyHgQaNeu4tQ4P/9cGNVuxfmJNPuVhdK9kOkdr5j3fb4rEGFVcfVwdet9DW1K/9nOeBgt6
 ACHs3qnYhP1F4ZZ4MVlfr0Q+kQF6vQZuI+Z4/FkCcVF2GIh/nnPY41DgjBZih/Ig6uExF2ENvmA
 LO9XeRV643iIV52EkYdBh3AF7ZJOFowMrYXNj2KY+YCHCahrR0G5Df55FrNeD12x9ybyt+zbFpo
 0GC+5xu6WO7OOmsh8xmVrzOCl/hsMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_070403_149365_41502F9F 
X-CRM114-Status: UNSURE (   9.58  )
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


On Fri, 24 Oct 2025 23:45:39 +0530, Ripan Deuri wrote:
> struct ath12k_sta has an array of struct ath12k_link_sta wherein each index
> represents one link of the connected station.
> 
> For each ath12k_link_sta, there is a corresponding data path peer which is
> represented by struct ath12k_peer.
> 
> Diagrammatic view of the station is a below:
> 
> [...]

Applied, thanks!

[1/9] wifi: ath12k: Move DP related functions from peer.c to dp_peer.c file
      commit: 07174dc94269758e271cba01680a8fecf35169dd
[2/9] wifi: ath12k: Rename ath12k_peer to ath12k_dp_link_peer
      commit: 9e0b56a33384c670501632810634553a767912d5
[3/9] wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base
      commit: 57ccca410237285f8f25a988655e6910cadc63f2
[4/9] wifi: ath12k: Move ath12k_dp_link_peer list from ath12k_base to ath12k_dp
      commit: 0cafe8cc85665f29b28891f4b921bef1854c2e99
[5/9] wifi: ath12k: Add hash table for ath12k_dp_link_peer
      commit: a88cf5f71adfc5e7412a505ee0077628231c6d80
[6/9] wifi: ath12k: Define ath12k_dp_peer structure & APIs for create & delete
      commit: ee16dcf573d5e3283fda601dd4bca6bc52251017
[7/9] wifi: ath12k: Attach and detach ath12k_dp_link_peer to ath12k_dp_peer
      commit: 5525f12fa671a007c6c6044c861eee86de71b576
[8/9] wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths
      commit: 11157e0910fdc9ab8077af69fd4496b80d7c39a0
[9/9] wifi: ath12k: Add lockdep warn for RCU
      commit: 6633dca572d8f599b0a1ead0f145a52049ec7709

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



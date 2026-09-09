Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8E1C79FB6
	for <ath12k@archiver.kernel.org>; Wed,  9 Sep 2026 17:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlUBBr80kVdfFPvGMsK73nviWBviEpjJrpNGHlLZvak=; b=fvo0xiByG4ZeZ+CRLJp43mgLwH
	pSH2Zei7HcuH9Ptc8H45MVvLHahvnxIGo2qa+ajY1gudYoHajwAQP8KrpEQIBul5pAgFfxUPJ1/18
	LA66AhN1LAeFfCK98wziFu3mu2jmfSD1DklDTnkpZF/KDl4lh+MwCTV1fWtH6lpdkzlECL7Idy5jM
	EA9eThmxtigxFm02bHboN5EV6lIem9PtfszkehGu7GoeFEYpSDvJJ1Kpz1+rB5jQ/vdvEG63Mm7xB
	7GkSEHntygxzaBtKNIGVBhAf5DUbAnauRSDQ4OYo9zTyd8sN8SI2BWvb/OtmkdgxfuXyJZEF7C4iN
	CNJ/GC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYd-0000000CYZt-3My3;
	Wed, 09 Sep 2026 17:58:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYb-0000000CYX3-1UiD
	for ath12k@lists.infradead.org;
	Wed, 09 Sep 2026 17:58:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7ZMD2065338
	for <ath12k@lists.infradead.org>; Wed, 9 Sep 2026 17:58:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlUBBr80kVdfFPvGMsK73nviWBviEpjJrpNGHlLZvak=; b=a1e+N8+533LeAnjX
	eR8UwtoeyTgQ2AKkpprep+YsFcopJg+wKyWkHhrvNVZzunxty8uR5Vl9tgtqg6zU
	owN0OylFBiuTGuP48ewFdM9BAN+TYRMBMCmKuZJoQe2AoBCsS3iAwvU+7Z+96nvS
	Q3ycCr5OAsEmM4fPBtTFpJhSawjP2onZl5Uq51+hfanJRoUcgq8A3byNoIIMAjoz
	Zy3TCe4zv1i/lXp09aLBeV+jh9BmVIH+pvJHyPy10T5l23ctNhJDrZixzU39YY/x
	hp7o9Rn/i8d4s0NuswPRqwFo3niDfTt4Fhr7AF0f/CvTc8YLenQFPhtKhVLTEuW5
	skwSzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x1p4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 17:58:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85798977dcso8942386a12.0
        for <ath12k@lists.infradead.org>; Wed, 09 Sep 2026 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788976680; x=1789581480; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jlUBBr80kVdfFPvGMsK73nviWBviEpjJrpNGHlLZvak=;
        b=NIWmQPYYlmfAWN30HD0YnHwrzGDWda7c4zp63VSZaMk2zGx2pGeEpXj69CmYzDr0kt
         tfD/fvVSemqe3CyR/qYMqZYI8XxgkOcIYAcN0df9uFK99X5kcGH4dye6ZvY/yJaVPBag
         jrNZK0Q6evZ+wY1oY0YqEHGkdjWPItXc/I+AOsiOK/ermMkR6ShSff4zs5eO+YbrnuYE
         PRh0RFoA03/2BvtJxFCyOuuiUpWBvP6sG9++v6WLrM+OzpkC3GqcYNaXPpuON5jD3yaS
         BoZyX883jaDabKBYOQ+c/Ay0ihDC8xjINaKieohznn1NCyLIO05ZH82IS8wWERFkVs3F
         hL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788976680; x=1789581480;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jlUBBr80kVdfFPvGMsK73nviWBviEpjJrpNGHlLZvak=;
        b=Wwo5zuuOcvTdpuVq84qe1bqI6d0c3N+yfHHqCkvJnfYOweuceyOiXqXh96D+UPhqBN
         eIrBAR9DP4kXABMx5Mnvb/EDT4irw4sFbtbrA0CJEzSd9dGeqfnzI9TI/Rngu4P4ppu+
         ukWXP+tcZWUaUQnV6yexk2w4ORFfaGte6JlQTcFjd8xR5h1L80/uPRwGczW0EaxAWwme
         5DNgYeIqvBtNq0wFXDYYegKoOAxmhUcK2BeBjB5UETzW50IlFS7WoG327ua2lGZWLt1C
         93aF3s/F9TTYeq0SfSuLENeLRedLQApmw1exl9uS+PFxZHmcZayezFroa3+u53aN4dbf
         faLw==
X-Gm-Message-State: AFuF++lq9J4bg5GYBsx5knFOrFIE8XTKUSh2X/4QunJwqmjaCcT75eM6
	sfJW+LHGOFjzqQlqOp+bVx/YK1YC5zntQu3FmIKXCy4kF6sJKtSgqMgWdYi2j5cZfq9kSsPvZ0A
	+H/5p2lp2gVuiELxIDK2aip2QzyzUa+6gyaPVvOxF2nAOqAOY3izDuvPN77McWEXt
X-Gm-Gg: AYBFou2FIYA1i7Du3Vm95cVnBu0JjsZkmCH75p27Wy4HbioO8DNgyLdPFy7TNXHh5DW
	ZrGaWbu0aiofXZGgI1ihr6RFJDguXyzCfOmN34jbq6Ohqdvh+pXrRd7m3G3U6EkiS1ijD+fPTc4
	Z1LAM5fkGSwGqEULxQL9CnruhRcoqIAOPiYCye55vw63i87KZGt64/Q0Z9qoUdqpmmssEQxujjX
	5zSerNES4q8OjSiJ+EGdYQMmEntGejzKnv4clWfxz7uKJq+JLLJrQtdBp+yt6V8Xg4JCAsggxCj
	xG+ejS7x+ACCowlRiLpX5TzE/pDkvCa5LtUFBf8RVmjhhBZwGAEOhas7OhSmedBucgoQvxn//Zt
	0f6HXQS3D/CqJTOHEGji4zSZbiiVprapLMqC/4JTJcGUePFvg2XZdYuw=
X-Received: by 2002:a05:6a21:a97:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3da39b437d9mr56708941637.6.1788976680082;
        Wed, 09 Sep 2026 10:58:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:a97:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3da39b437d9mr56708887637.6.1788976679569;
        Wed, 09 Sep 2026 10:57:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-339770f0489sm14478225eec.8.2026.09.09.10.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:57:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
References: <20260828065534.1537-1-kang.yang@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: preserve PPDU state across
 monitor status buffers
Message-Id: <178897667862.2048605.2420696819574029448.b4-ty@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 10:57:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: ohGTA9vPAMG57u24XteBk66E24n_-X6v
X-Proofpoint-GUID: ohGTA9vPAMG57u24XteBk66E24n_-X6v
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX6ZOjRn+EvH+m
 DhLVhTkxY4O8NGlZxvCVnnsgx2XWpemazVtf9tWJdUu2rOKxBQXZ+hgBSp/ui9Olh80WRrLSPGX
 x3rNzeYuiiyjIjit+GVQcYxvk0YX9z4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwMCBTYWx0ZWRfX8E/kTmaOuCCr
 Cu4VNSXhmQ6tjDrSLA6oTtPcdMFGmx57OZ8bjrVdS5wqi/qaLAcB2bbVVUCGkNh8a4C5Unu+VPZ
 XcATa3UGvwoua3az4O8ONyZLnBKkvkzZT94emd3i/WEj7z0C8eyqXk/YMMQr8CSUWqYm/X8DBM/
 LQD3CRqm3N0XPkppFoAcnoBqTnIOlE2HFMtR8AwUdJq05ZgpcU8+XO30PfPelYGp9J1gyJDlaZC
 fKLgDlOQu8Gf1s5Mn8TxwW/7loHMNia2SZEKxxzy/TZJipwJONgfeNG47i9z9svSklIw3xswgk/
 QB+dpodtroaInxgY/Pb2ttNbOWc5nsYwdIUcrHECQVzvIu7uRWTHDS2VDxmSwOXws/EUGwPGTKg
 CA3/THXinm5ayhcYEemWLnvxQS7UAc+qwTapkfZ2FcC6kdAS5NYq1IWzTxXoS2PjsLwYXIwViqE
 dHvCrFEp3STn3Lta0Sg==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa19e28 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7yRbvbv0muN7hk5lIxAA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_105801_409421_69EC2A8D 
X-CRM114-Status: UNSURE (   7.56  )
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


On Fri, 28 Aug 2026 14:55:34 +0800, Kang Yang wrote:
> A monitor PPDU may span multiple status buffers. However,
> __ath12k_wifi7_dp_mon_process_ring() clears mon_ppdu_info before
> processing every buffer.
> 
> As a result, continuation buffers lose PPDU state collected from
> earlier buffers, including ppdu_id and PHY metadata.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: preserve PPDU state across monitor status buffers
      commit: 69b2d06dafa4a61b718704d655dd370ba660052a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



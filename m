Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE10C4452B
	for <ath12k@archiver.kernel.org>; Tue, 21 Jul 2026 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lb8ztYm4xqlZZ0kex2S3OG/vVlZEneV88+4frBDQCA8=; b=BzvSxmea//Zhx63ym6GWnv1Y85
	xtCotju9wfdSH0Y7zlUYJR0nk8E99NWa6edqySazsrn6xOnAcwGpmagBmkF7k1FpBV+Y2rBoz01Dn
	3ILHkC298yrDkeeSU+q6hB/6C/szS03c3u9XgiM3t4fMGJzb1UZrGTQCTz9QHCV3PyxzWPZWcF0OD
	0ZtFlRblowjOYcfEhsvDXPOlb2UCJh5NXrLpdcSXkf7MTcnFK3ZokYR6wKNepaHPHxgVOICGR5MwB
	G2rC79SQird+qkcsaMCiBs3OTqPD16zOoLL6kV3tQi1rAAbHmgATMd0Zv9N+bTqlM0+5dKd1r/KLI
	VmRQnjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGfZ-0000000AKqQ-3M2o;
	Tue, 21 Jul 2026 20:02:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGfX-0000000AKpn-3MoQ
	for ath12k@lists.infradead.org;
	Tue, 21 Jul 2026 20:02:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2g0B2449165
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 20:02:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lb8ztYm4xqlZZ0kex2S3OG/vVlZEneV88+4frBDQCA8=; b=BRiwE78sYIhHzNz5
	2f/vKiWU2OcTlw4c++cVuOotkK0tjBJDmvGIXjO5VP8mNvmy43xE95CWY3WyBFF+
	Ujiu8AmtYMcMBRLUADNhP/YlfeTyBBhmQ8TL/VJ6nIcEdIVveTvpKMAlj3AAOppM
	GTFPETOrhgfiBE0Uf0wmWgBhenql/2p0LXHytkz+9j4n16BvbZv6PBqp8fM6vNTC
	lggR8382JMKafMG/kcgKrrmzCUiJG+Vc2TtngAdiFHbKVUyjwD8qo7FbXZeXZCnJ
	Um5uUgtArhszp2DmtnfgNz8E8cKXl6+Q/rI0CEydZBwmlgjAqCTCiM9+RcGVW9Gj
	KDJZmw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6862wnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 20:02:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso6905388a12.2
        for <ath12k@lists.infradead.org>; Tue, 21 Jul 2026 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784664141; x=1785268941; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lb8ztYm4xqlZZ0kex2S3OG/vVlZEneV88+4frBDQCA8=;
        b=LRbHVs7Uf99cwbCycJHRQ24vZ5fEJDdjH4Q2ay2gLx27QDnLya7pSfK+nXmkEijR4+
         AqR7skDBlsKmrzFoFbwhDRJa2wTbBaKT17ZbQyH9MdnH31bxmbgZVlH3W7vfAdxqoKX+
         HCe+fRBj8wI5OSbTF/k5uPg2JdOOTooHmX9YTJRpdky2u6fzDBKbWmpympo3E41dgDom
         BkR97T54yrt05P4wXbZtj22ZWagBGV39ojl0/dqwRIyARKwxSW7Id9QdYOAoIcr1A2hi
         0+RLtmCHGa3wPc6B4J1Ohajc3N4QuYwqifmvOwRUCjvB7MnpWeBovxJm82JJVdrg1TOK
         D25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784664141; x=1785268941;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lb8ztYm4xqlZZ0kex2S3OG/vVlZEneV88+4frBDQCA8=;
        b=KF5zxtNI9fDDvu7ZPY0BwG2GmG+o4Z4nKPIbcvhWjbHLggX36/tDSd7ncr/+oMVTff
         IzPQWvdJrpSejSKVmXAhw2Hnwu/Sw8thUsCsFA82fjA2wAAgkqxhGB8/L58TIs9Gudx3
         UcT8yAYLVhB73DJYNzjjS5UYpy85Vj/dJ0MLnq2VVUuwp46TD6vDwnUutY8mAEi2125n
         xODcrasi3PYVrcXeSm2LKN+XKLZqibIOGvqeuqs6QWuB+BficRJzhc6D0GX24ZXTeuzS
         kZ4vMmD7Q03Ma0nmJZ2ldaP5uK2v0y2uRrObLgUTk0LP4ONkm3Ae8qZbPZTzmC2/2Ny8
         WUGw==
X-Forwarded-Encrypted: i=1; AHgh+RqFE2hwXHMx6SLSlFkcX5Lg5eQtyCW12unl+N3GqFwFQtDaDE6cahdtlaTVAJlvrY1vF/Yr1+E=@lists.infradead.org
X-Gm-Message-State: AOJu0YziPJoQ9H4zeMNfB5oaT2mxRcLpcnIchL0HgI9anecL5phbrr0G
	7WvHDdP7mIRzjLoeOCXrAlP4I1ayWZdGZxa+eEcpiGRwn/JgmEA3/I/U9OMxVkl05bzXVzYbSpm
	zTagSx7RvPHuVtnPEsbb8wPXoKtnf6ysHLlCDEoOjqIOLLHz+HlXYEDJciBCK+WG0
X-Gm-Gg: AR+sD13kZaKXjc3rCv/p9fFriDmCPJGKXfdcJ1F18pNdfPStswfQfANNyf06NBu+kUU
	V91cxbF2yza6nsEQtucCy/PnQGsIZxwhKTen+UMrfwFWxAfFnH97IwoNz95qq6fY3cLuAnLCWY3
	vrfVHsI0dLcZi/9Gx0BhH+Q+NtuSFyAf75EmgtZ+JYYB+xrgLl9jiWqctOAAyxZKxyOCMQIF0w3
	s6wbGUz+h+I6kIpX1ZTuvqjZ6Xa/QSO4xHBbhyFlefkc5Ce1fxh1z6vEZzTTnaKQWM9l6GiiKX0
	NL1V6v9bUw4U+JKrUarilA2p7WiqarbZ595mRUyxCQGgA9k/qWBexj3z5WXXuUGdzrK2MicB9pN
	NBeW51pSY4HCddUue5VwhrH0IoDow7oYb4/giE8l1+xwqliSI3kv0Cik=
X-Received: by 2002:a05:6300:512:10b0:3c3:daa2:2b7 with SMTP id adf61e73a8af0-3c3daa202e2mr10287560637.44.1784664141520;
        Tue, 21 Jul 2026 13:02:21 -0700 (PDT)
X-Received: by 2002:a05:6300:512:10b0:3c3:daa2:2b7 with SMTP id adf61e73a8af0-3c3daa202e2mr10287517637.44.1784664141057;
        Tue, 21 Jul 2026 13:02:21 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1b99esm1574958eec.3.2026.07.21.13.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:02:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Matthew Leach <matthew.leach@collabora.com>
Cc: Kalle Valo <kvalo@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <20260703-ath12-survey-band-fix-v3-1-2fb050c2505a@collabora.com>
References: <20260703-ath12-survey-band-fix-v3-1-2fb050c2505a@collabora.com>
Subject: Re: [PATCH v3] wifi: ath12k: fix survey indexing across bands
Message-Id: <178466414007.1747165.17084648998286616462.b4-ty@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:02:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwOCBTYWx0ZWRfXyjX6XKAPp/as
 Dw0CIye0GUJyMeEb5N1+lXZKRIatMV8dOnUfQhZPR6NL+SaHct56wMKKMkat1MfyGMOI50sv2Tb
 +KgAHU8cS4N4eTmNFvkgEVWd/4whbPg=
X-Proofpoint-ORIG-GUID: xqcAB8aFob6I3Coe1XSHq3q81EplWWOv
X-Proofpoint-GUID: xqcAB8aFob6I3Coe1XSHq3q81EplWWOv
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5fd04e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hD0QNefKyflHWApe_3EA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwOCBTYWx0ZWRfX3qmkGHYVQkvH
 36ox4CbsPV5L2eQCDFLVTVicjAiy6KdVRtCpELgklRdHgYD+IUJ4Islol2KlRRNMbV4+5fEZp2o
 9cFVEsQv2zrV/uv8KSD10qmNs8/y8osRBQGbRtk1p0ykyqzvnuU0VfAe6GxXr2suWk3fQtBr7Aq
 nSAMIuTxLx5ZGnBvie3xzLlOUk45oymu2j6XkVFTaXlgh7/nX05dQp6O/khPit6+DxfzDu0kg8v
 NpGf8i4pb2ArdNkTRFvU9CsUD99+xvY0cMegRLfJsUCKYApmZEPNRy13leL8yw6iqq8z3bd3Kgd
 PS0sfVoD+MN9WxhsP1ZXfu6j5JYFjxpVlvAZAwezaYE5ZTHbkUognwbYzXHQl2P2AMZ4pLwL5+v
 es7ULpDmRq79r2nBQ+K+iyz1uj3x1pb9eNI5fg0pSiqI1VERjr2PDoJyz84LpKzG0TlDuYRE5oi
 Mr8cEvoJCoHPVyaLaKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_130223_966145_F2E01B34 
X-CRM114-Status: UNSURE (   9.76  )
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


On Fri, 03 Jul 2026 16:56:02 +0100, Matthew Leach wrote:
> When running 'iw dev wlan0 survey dump' the values for the channel busy
> time have the same sequence across bands. This is caused by indexing
> into the ath12k survey array using a band-local index rather than the
> global index passed by mac80211. This results in surveys for 5 GHz and 6
> GHz channels returning values from 2.4 GHz slots, making the survey
> unusable on those bands. Further, there are redundant survey slots for
> multi-radio/single-phy instances.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix survey indexing across bands
      commit: 6cee0214da2f9214d85a87eb6300bf7e23038bb1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



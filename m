Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7A0C4451C
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AojuRYk6z30fX39EjxdpLOAOLbMBF9jrafkQwbpO4M=; b=WTocCMiEH73cNVBBjCB66cZLH8
	TE7nyLrid1wig5yvW0k2eFKi2lV0n2i6ckIWvY4uo03aS90j0nYYrB+c5MmptXTig+hhhhAXniJkC
	EBWM28J2WTEryY44v4YO5WfmXdbbvICJr1DfRD3Ja1YIpfxxvJCeN4wjHypF5+47NyLm3SzckaBNo
	WsRxmrw6JR06CS7OZ9MRXS9y13mp2IOxegLlV0nVQfeZ4rdGd8jycL4sdxpVyLnTzETe9OVuu4+Fz
	eGFqX5veRvIDrEAz5w84m3x0IuUqmYRkRGwtFkxNYoNG7WMuYj5s0xolRFZAIR95oGyi4sUEzT/Bj
	PWvB4Btg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8h-00000002YTd-27if;
	Fri, 17 Jul 2026 15:06:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8e-00000002YR1-24GC
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 15:06:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7iRB2186813
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AojuRYk6z30fX39EjxdpLOAOLbMBF9jrafkQwbpO4M=; b=kis/fnUUcMagspDg
	sP6BubVQk8G+gvPHCqoAj/D7TlhpGedyYdNm+6z5AT28h4z02ASl5WYD+dVHeV8o
	6CxaHPkwmqbLSs1CM3wP8nkZMQkRlHbicZGa702e0jVK/BqVWYgBR1MktmA55fmU
	/+L+6/QwhxDeG/BCrLxNDfu0cEJn54PUf2+7pm/ExqtSdJAcaZz0P/VuvLlQ/cMI
	r40qnPQiqqdsIMwWRhMqOTU1j79zGUOStoHLNJPzVF6t1/ocK6mW5e9fY5TEaJ18
	gLLPlsptRFs4kpYF/PPpd5TCJYCU5Nwjb/Ap9NB2G9COevysLYiEuYsTX6DJ2BvT
	WFZ+8A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3atd2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee894b3d8so81121045ad.2
        for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300767; x=1784905567; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7AojuRYk6z30fX39EjxdpLOAOLbMBF9jrafkQwbpO4M=;
        b=Z1OjXjysvco9unwv1GZtWoHkR1nlmaoGMuRUS7HMSiJqQa5uByvfpN9JBSNa/Bf6+z
         8XBn43ebMG57/RIMPpW/xgvktTzK6/ew+/AHLTO44DI+patIdiphSNumrWuQjG8vZF9k
         P83+qJHUdMk2y7zCkwwcLYr8GZ9c+tzKh7JG8Ihj8rIbwtOtG8zqq453I9Wig3I6sYRH
         UMg+6/Ju1W0hWAeihDOjCIGlxrSNhTH1DemUnLjtCU1hj6UCY45xGiGMqV/D1VMhqILb
         77sOePfkS5BpIi7KVSLfjm8cx87TJihVf0ZiIbZIp/RseD0cg7kLHQmVa4zWUHzS0bFI
         Rqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300767; x=1784905567;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7AojuRYk6z30fX39EjxdpLOAOLbMBF9jrafkQwbpO4M=;
        b=G7Xjf1j7YHrmF446W6rrbvQ7vCgtFemAi+GKjvVHHqFOR5mB1fV3fuCVIEY68uu6QE
         1Ythc50fmHNpFb6NcnhNLyZfOBW4jO7D5vk8dADe9ZqYpWLAXvMYPkGBTNsbVulN/5qI
         e27HjJZgqHa766fJhX3ZQuCgKOEkyZqViPOziTDSSWzLPJJox60sNOPT8xNLZChLsnZo
         H9DMFTOCLAbVFCLguJM/7EuOHnW7A1nj1O5b88Fx/iLqqon1aRJvl7L3cmqHqxnRPiuS
         gomjlkkKFeCGEOdkaGYFO7KqMmc7Jmnv1VdUGGZl3KN9NezKtqk5FyErf3n0biB8TJAd
         WR6A==
X-Forwarded-Encrypted: i=1; AHgh+RpBt71fhXrjAov2fqGTygq/dr6cYGWd4QTJ+aRK5/fFDys3se97r9hNrUfqgDA9vcQ9gWhfDoo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya4lK1Xxajbq1D7d3HgfMedOCX6h7VUoHPPHzuCCtCxK/jbjS6
	zijTHR9hpFznYwcWTWRLCfIHhhdVsw6ZJTZIq8X3m1MIfkHwclRpviWhpnWko+CkAcTZ73RQXjI
	8V+8gMKEde2eJxsX3EQF06urftP3J8OQz6HkaPiBSOfQF54lqv5NeBkND9+zHCdYn
X-Gm-Gg: AfdE7cns/qsvPgngaYNhXd5kO/Cj4P+zWklcsCFnpRqed0r3+mgUmRVWhkjoQeGINDA
	Qt71Q2GT8YD4TFngZswzfu5f7Iih3I3nPlu9uKtsHQA97ImcvYZJf7Qc/CyuhhLw3Wdhg7RIHgU
	6ZI8QsB0F5CrM2cpZy3GOGA/NUZYkjN1g0y3FeL/e3W8QcwtPuZ0Elk7UvEnucdGW0T0ZXMSq2J
	kitcbxnkosYmee7vmM6bNByeQ3IwwKZ5NWWXfChmTPbxRaNUpW2Ms0FcmJ3DM+DwD7uSf+NWFUa
	dhXh4HWkEumS4bbhkN3ZC86H2Bj9SIm+mffqTJJ9KtlpxP8x9BamdYUjgy5eCX2N+l96FpWuvq9
	mBFKnPzfWTfI9nYZhzAMU4x3oleMcK9JfYT0okQ4WqcgajFIA3GPvzMw=
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr3042964a91.19.1784300767311;
        Fri, 17 Jul 2026 08:06:07 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:38e:3fdc:62e5 with SMTP id 98e67ed59e1d1-38e4b479ecfmr3042899a91.19.1784300766645;
        Fri, 17 Jul 2026 08:06:06 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm15681190eec.21.2026.07.17.08.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:06:05 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
References: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Correctly copy the hint BSSID
 in WMI scan request
Message-Id: <178430076545.128359.8126500058186814616.b4-ty@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 08:06:05 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfXwX7NDeSk1Ghr
 bJujHUSTtnFxqfP45K/GvN1TG1u8pY5ropZiMbjCrQQWYsRTs2GKcwmCnWdKwwbZJ5JUTfDXDr7
 LjfA2Vx8JtnB1SsgfZB+ShxYMyiS+Hs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX/BZhm2BZDGbf
 uy1iIe5JEMX6NMGMP0q430ViqgP/h+Gs944bwkFD3/HxSYvpi5LK8dbRR5xMR2gn9FGaqRVwx3o
 8Y8BcKI5PJ8aiaJUEZ7z8HKZmUZKpUo+qJnbEwEjbkBBcri57uU1zNx5OKqeQbyYGKewUvFq2FS
 uYRRoIg1CIKgbxF8essRcMC+MzrBazTh2BXD/PEqrJJ6lQEwQUkQDN2NuvUjhNZ5MBEmIH33IFH
 P9FvTBYhs9UaigNIn8bqARyQ/SOOlacnEVS+76HcYOLEgnlvawjQ6muVINx99NO+vScZPGKnXj5
 sV0eWxFRZJ4gHpoAOwMH0vyLAXb6oeT77rGWG+N9KS80iq+eSNFMYTiVAGSoR1Ztu/bch6NubJl
 g5RyqTKLzpZf7OgNISRDWy97hO8WU4/dvZks6QkKpXkz+KNMt5N3VqAiAzCcLx2WXQVQWARAPtP
 gZgU8Sh8CPSCv5VVRLA==
X-Proofpoint-GUID: SZVdsUCmAwvkxerlutYkx-KM2TeH61C4
X-Proofpoint-ORIG-GUID: SZVdsUCmAwvkxerlutYkx-KM2TeH61C4
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a5a44e0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=IvR6sJYjICgyGHFFWMEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_080608_559236_C0BA2E4F 
X-CRM114-Status: UNSURE (   6.72  )
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


On Mon, 13 Jul 2026 09:15:48 -0700, Jeff Johnson wrote:
> Issue was reported in ath12k, but exists in ath11k as well.
> 

Applied, thanks!

[1/2] wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
      commit: b127f79a49335679d117406257cedab4fc20596a
[2/2] wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
      commit: 0db9d58c8757d0be5ed546109e37bcb10f6c1fb6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



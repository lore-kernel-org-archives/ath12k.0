Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B65CC4450B
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+blgakAhsfKCNclx6cZEtzfMJEN4zUflrr2P/mTzQI=; b=byQVQClfj5cVWI19xnT0Im3YcH
	sV7qzqHNHqOn3RZqW7ztY6iNwR7TukaeQAuh8tez+d+lLzslTvUpf7T2X3qaABOYjwE3D17x+qg2H
	YiTNkIknjYxDIGrOR/8Xm3KP1+rr8klm0QN9xTkT6C3bev0L5ow4rqInAwetSL8dRzP0es/cRH7oG
	Z6/vXocWx/qkICC0GRWawd/cGOceRo/iFKBveYBuAx3g+wGjPVl4iO1A+zCIFnTL6N0xnPxqtC/vZ
	ohZjiIk/VrMxUYzSn0FoINsHhcat1VXkKyFD5r+2zXdgYOrPRpJKrNA5NKrAx0WKyE50BzR2fllkb
	bV/fxvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhYF-0000000CqKh-2bOJ;
	Tue, 14 Jul 2026 18:08:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhYA-0000000CqE1-0GYx
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 18:08:12 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG6u6W975504
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h+blgakAhsfKCNclx6cZEtzfMJEN4zUflrr2P/mTzQI=; b=jtZgxNsDcLnKP/Gu
	8ByGwxt6dyT6TqE0GpB6A0n7JAjVm6cijxoju4DVKMjoru6u9rkZHpqA4rlZ/h97
	qOX7BMxVBhwilsgs3ztvPA1ku98ysig/NBSXcSJbKblCjdB4smfxksalv3CwAHpO
	KYb/fVK152LMK4RcT4WHIBlpPbR60UCDUNfkEdI1+TSftaHUVKPzFh45B75ZnJXt
	n6hTLXA61rEaa1qpT5Xlio/Z6pCMoqs+Fce1/+SvPtYCk8cp+HrG1NALzKY57PSd
	XHMbmz8xwdvwaaP9u+vajyCLTIWk/UlOmrywSElaSMX837r4P0HzMEwv38k0Ex/6
	6GoxrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdgeq2kaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 18:08:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so92944085a.2
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784052488; x=1784657288; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h+blgakAhsfKCNclx6cZEtzfMJEN4zUflrr2P/mTzQI=;
        b=MM1IiDIdTrqxpShCZ8IAR0Wk+JVvrO6qGH+KFJ6lT0ffzaIK20bbCY/Xnviz4o4Fcc
         jco6RtiBxOKbueXC2lkirr5SUXfG1jCxaM2cvSVsOuiGxsX8Ql4fKsaM4cspRtaw8rEN
         N+r6GVf766lpkYn0jxPiNZ6yVQLF34fuCkK56sZjNUN+N1qPpVzHIAUtL/TxO+I+kvc1
         r4mCXCXnQ5XJ9GtAVWPZNgh/YxcRBJInDrq+bemC+emFEmCEezhpPWGAfR0nNHUifJW5
         MTTzIJfKXYjmEhk1E2EDbQcbQ+4NORFCCbCtEvRkfRD9NXSHquMxweQap7cuwlrIUAKL
         pGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784052488; x=1784657288;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h+blgakAhsfKCNclx6cZEtzfMJEN4zUflrr2P/mTzQI=;
        b=khxw/hT4Uelvnd3ygM3vmVhu13VNKEA5kQd7oKq38pfkwPqu8jSn8NPVoKIAkFgGBN
         72WZvzrlp/pP69yl2i54vhF7ct3THkt7JHFjMj++bBTWOwLYpiuEp4mfp5DT8jUkUq+a
         wZMQEum7N5IhA8Bxf43Y5eaqQRQp+l0g1OcEdvHswydnMGyX8diFnSLVH7DSZAR2BFrS
         GVOyUlxIC6OfK+2NkKcdqzzx9j0iNx0TxMPZpDdnhGi90mJpxGz4rca1+P7tdzAZKc4O
         Jq/RKdeGimn3WIdRuUQd+Ksx6K6JX/OKXUBmJ49o9QYOkI1Cku41zNG0Di3kZ+mribPR
         33TA==
X-Gm-Message-State: AOJu0YzY1s4IJA8zPN2D4wBkY6DFT60QTkNBvVv2Ev64ur4bhE8GXEJ7
	QiJjFGal1JxeRLjMaE8r7RGjhn2cfDCAHIrr23z2lSx/tFwf9uzA7S4Mr6ew6XfCPC4iEVH11D0
	FRIshyqVDWhfbMeokAhY1GGlUZdcHvLkRF0w3htqRJ0vdxaZI2qKyuMEJAt0ZTWje
X-Gm-Gg: AfdE7cnPn9cGImPnp+uWH4T0cXmB8VIzhV0rhYp/ocrb3lOtUxb3xg7Y31WwLDVpRgY
	hTrpiSrJeawn9+a4+9NnTkM7IHG3OTC1BPljI2VYKnAkMnbDziJgxUYOx02NN/oyErUFeUsUTuA
	bHdH7wDxv/PiPV/VpxKeSElGZL6+oN2r+BFzNTCojfPWlj/8xbxP7+hn10wT2BNmRj2xo3xNC5F
	3cP5PJJxd3VbKv5xEiUPHRHRJdwEWcv1g4HUumjVRVq2akyQdPn881ancbJlqvRY12y6tJggdQ+
	Wx8oisFIrXI5Wzca/mlokNZDeOSOS0+T8FWS7ipsE7wEuHTwNPbOwqhjXtFQgJqNYzM7Os5B7aJ
	/8uScOldxjXbVsCQB2Bj2dzwOBeuQItoXDvgwkv2VHEw2Zf2qTQSui8HaFTP+MINQZw==
X-Received: by 2002:a05:620a:284c:b0:92e:7f13:1489 with SMTP id af79cd13be357-92ef2b4b8c4mr1476786185a.10.1784052488525;
        Tue, 14 Jul 2026 11:08:08 -0700 (PDT)
X-Received: by 2002:a05:620a:284c:b0:92e:7f13:1489 with SMTP id af79cd13be357-92ef2b4b8c4mr1476781285a.10.1784052488090;
        Tue, 14 Jul 2026 11:08:08 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930759c63fbsm465448885a.22.2026.07.14.11.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:08:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260710053534.879233-1-aaradhana.sahu@oss.qualcomm.com>
References: <20260710053534.879233-1-aaradhana.sahu@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: update IPQ5332 BDF address
 offset
Message-Id: <178405248657.4102418.408455253026492644.b4-ty@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:08:06 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX7TVkF3rOXVT6
 KzWBu7RpQPhIIomluby/a0V4j9KOlDCcI3Yx5jNM1ljlBXDItfI+ap69/3uQ/ghN7GwkB27in6l
 0uiWRt9Q5RYIVbZIA5D15Y5zOISklIOQ9FTcHHUkPUg8bbMYncLTpI3/nAd4XGWJ68kgZ0lkRv2
 orPFuwKnUbv1NqD37uJg7f0SsSGRGVlejH+uFfiUbe6G4IvJcAyqKEqiMIM4+JnnOtjPEz0U9yv
 q6yKyf9n+bNLsrVsejtUiF3m7G6EJs0hUs+c+M+xgH7U4/G3WCsTNI7TOFVjyzIm0Zk2xgTUYsm
 byj+ShfSNa5ZM9ddUR7BKNy3ryhcqgDw6BWMeo9dUpm7n66CnmPkzEJbSWes4uj0tKiEY/e4xUN
 LLGfNxtbOoum20H1xuyHtjcwvRAvKzqtXBUpLsqbkDYzRsl1jpsrbpdTKQkflzCOmdKZPqk/wQc
 NIHkk5zVGC8Z8Qahh2A==
X-Proofpoint-GUID: J8wpZwf31eixElyuesE3DBps88Z2uVc8
X-Proofpoint-ORIG-GUID: J8wpZwf31eixElyuesE3DBps88Z2uVc8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE4OCBTYWx0ZWRfX4cRZi9+5pEgp
 HmU2GEf3kR/slLZCG+OPi/hGseo6vo89bSTbOLsv2au1OctM3yMPyIgyRAJNU1bcR5f70AGemO2
 7mU/ZWb2+cXA8IleCYH4u2WlnF5coLg=
X-Authority-Analysis: v=2.4 cv=V9VNF+ni c=1 sm=1 tr=0 ts=6a567b09 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=XavOMYws26oirl0MwwMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_110810_234991_655B3C31 
X-CRM114-Status: GOOD (  10.88  )
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


On Fri, 10 Jul 2026 11:05:34 +0530, Aaradhana Sahu wrote:
> In the ath12k driver, the BDF_MEM_REGION_TYPE address is derived by
> adding a fixed bdf_addr_offset to the WCSS Q6 region base address.
> 
> The current offset (0xC00000) works only when the Q6 region contains
> the IPQ5332 ucode alone. On some IPQ5332 platform variants, additional
> devices share the same WCSS Q6 processor and place their firmware
> ucode in the same Q6 region. This results in multiple ucode sections
> within the region, and the existing offset can cause the BDF memory
> region to overlap with firmware read-only sections, which can lead to
> firmware crash and driver boot failure.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: update IPQ5332 BDF address offset
      commit: 7bbce23531417dfbf9a2c1a38f31010a1afdfc91

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



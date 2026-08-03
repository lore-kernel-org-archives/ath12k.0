Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDA1C55174
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 01:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHmQgqMQv032aCyZDAnWTWd7d/wKQX5fXHHje2dMjn8=; b=F7ISkhUxPK9Xcm07GWmBpFUX0+
	+/SQOFCurkOP04RN52HJ39QVlf6dyF/LVzNdqQFEY8kM8kKXd7AcvIPTYR3qZuGnuDYNLEBvuiPi/
	SbpASHKPJpGfb+4kCRh4lyeFPmtz+GapdYkPKmgkJLgyy+86eG0HKwZ6qRr9NlRW3glm+ML4pFcAN
	et5gM6cIlRpC7mFmj+OzEJUXRe1QRy0uxXOixkQO/5KOI+40+rtuUIs8aIxvsD0E+3V1YWlLDV5vc
	u8YLYnlPC3shTQVfjrrwEEATlc3AJ1qZJq1nZXZCIxnPvE9Sxb1sFPMJa+bU77/B5+m7CPPqtftlj
	SCzODZLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqht0-0000000GB0x-3XRt;
	Mon, 03 Aug 2026 01:54:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqhsy-0000000GB0B-0MN3
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 01:54:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LWPZa2554641
	for <ath12k@lists.infradead.org>; Mon, 3 Aug 2026 01:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XHmQgqMQv032aCyZDAnWTWd7d/wKQX5fXHHje2dMjn8=; b=Pma3vxQMUXnv+ZMf
	zJN7CJp9Jpx3h4Ty23cEfa9nUp1hFp2iWlj84PIp8lRktrfmuSok3SFm0Hm+PMOY
	6Dpk0/UXe41bC/dE7ncbVyYJZkbKImf7WyYMkatnZbEhtCnQZo4GMFhm3HBXts6q
	QpamReCj3eBuMWxwfFZ/QV4ggYylEx94I+9YMJbo9LLMloje4n+kn82L34LMI8CD
	78T2PopbelKuSLDoC5fo1/buE5IM99ssRBgV3bIXkEqbPNFpiHuqlIVJm0uixAzG
	lxQKNNGF3kdDujMAtCbqRgAFh0akDtIWaCMIR/wHgWHDq+vg8jReLjUXoe233Q8k
	cHEAoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fsa383ujp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 01:54:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cceabd70f5so88233465ad.1
        for <ath12k@lists.infradead.org>; Sun, 02 Aug 2026 18:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785722054; x=1786326854; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHmQgqMQv032aCyZDAnWTWd7d/wKQX5fXHHje2dMjn8=;
        b=NXSfCxjLxw+ZzT7Y26QY+BVOCLsStRhv3+/vN5OaDSiVKRawXW8SOwS2KVKb3H+3hy
         Tr2C7IGCKPlyYCewqI2nbjxjcJ+KXF8KggcZMEV3gKX6IBGDVnmzh2MuKt9RFQuICnko
         wQ76pDaNSb54zUU/+PoIFYMayiBKw+wSrjJKWhCCfKulVjuWG1FmSh8PhKarw/auyI0i
         wAeU37oK5oadMUc4AVdanfL8d9772w2N9p/BEieg6R4ffUtR8GEVeVKaoSbmxSNTASJP
         bg4sfpzezAqceP98DWmH9OUc8xAj5iJh1w8vo8FYs1+x+nCL4Nm79LvDuUeHqV8mkGYb
         BLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785722054; x=1786326854;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHmQgqMQv032aCyZDAnWTWd7d/wKQX5fXHHje2dMjn8=;
        b=HIbRSmdkxwf9doAG6/XijkV42sJLP7Wl1J133AberleGfhz2xyxlnWTQQBa6yO0aKD
         DixPcCtizBaM2AqbeYSGa5LBsramaEUtOu3f3yyP2Pyp6UBZ5CEa5UGdkQ6NieFu5rtd
         oar4mrpDul7s5xhd6KmAOjf+EDjth2m+eGkD/WNYaBpDhHbpslp/DVYbqyRLe9vkOcLy
         SVnR2R+IGkLjUOKFr2VTpW+N4yxNEyZ1ZLmhzewPKBSW/YRJL4W41tZieHeDBE+hhQoe
         oIVC+1ieDe1dYE02jdVK2WABWc/jL8nbeaTpvDyNIsv67ddELngcx5ppSmiK3MMq4PKR
         iX1w==
X-Gm-Message-State: AOJu0YxrCZMjwrTt4hYIfA2ZWnJttZLG469uwIM0SWLEcUmktoV6zhaJ
	/QN/nQF27s8k1Oik6pBxRM0JI24XZ2W+OrETmsq5oJgx7Y2OmR+l7LwxizuNhcGQyyADk4xJj+K
	T7sDd85oFqEz2+GGx8YDRCkg0tM0uAf8tJgOVHr+99yvOrLABt30mB9jMtVEiQOLc
X-Gm-Gg: AR+sD12n4mT9xGjDAkDARJaptqTF0awvf4Z+4OzleB9j8h7F3l+MtoVKhuDdDKaNu0J
	FBRei65bPC437krkgrzrPCZcXx0gaJcR40UxfpWPa949qPDSK8RsUiq++UGmGN8zMyzVIErRXx+
	WQ2+KHonn5S+hiPACUk/OKjmdVa+In2T2EVE+YacMEWQkpYBzyDKApPzwW1Jll7RC/uxIqizPoU
	k/lOB65epBBd9Le0jh47NIwsoOk8ulTU3JwH8pjEIchzY+hVcsXzJ3CgPtzWn4dXeEwfv0C7gzp
	KFpeQOHDnNkbgjyEdEn07a2oxEagKQj1Wlx0vr6f2LymUrUYT9xp5vkGPwjWS7Xi9hQUafWuLWB
	eNKtEJNUnLFqVyeQrRGvSxazBZyTG306/NynrT3Gp3bR5S2Hx662ZfGZyosiyOXT8SbehrmoBwA
	==
X-Received: by 2002:a17:903:41d1:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d0521eabb6mr83034385ad.16.1785722054641;
        Sun, 02 Aug 2026 18:54:14 -0700 (PDT)
X-Received: by 2002:a17:903:41d1:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d0521eabb6mr83034205ad.16.1785722054265;
        Sun, 02 Aug 2026 18:54:14 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae58d8bsm30212665ad.26.2026.08.02.18.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 18:54:13 -0700 (PDT)
Message-ID: <a990c25f-8f6c-49bd-90cc-9c4d0729fcc4@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 09:54:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: remove unused
 ath12k_dp_rx_h_find_link_peer()
To: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, jjohnson@kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260803010532.302038-1-miaoqing.pan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KezidwYD c=1 sm=1 tr=0 ts=6a6ff4cc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=A0BUc27G3Na8zYCJx7UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAxMiBTYWx0ZWRfX9Qu8+4Ay0/Yh
 5WKD5b0SN6rxUKsdmGfwE+0zT0jEBKW+Y8vuHl/YUzMuT7ELwlDQINPnnBlbDwiLdN66/5+Ookf
 dhBNK9Oa5B2pu+P81dB/oQRjkz1HvfM=
X-Proofpoint-ORIG-GUID: AT6mxXUKO8mwRvtbEXAYzLudA6uoQrYb
X-Proofpoint-GUID: AT6mxXUKO8mwRvtbEXAYzLudA6uoQrYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAxMiBTYWx0ZWRfX2Ly3wMsaMa9w
 GdaMFlN+bSV3RADbHMkJEJALEpmW6nnVlOwezXA1MOvc7WY0YV8TXQgvKJfrqjWKvzLO9QFs/qy
 Xlvspn774IUmEl05/RGdP85C0HCdbgQrgHGE8X0l/BaqbCYDUQn6u3h/MnIPVpplwBHprn7iQqZ
 z1H998Kq9tD2srNVhbvlUsf/0y4xQ/8e4DKCTVWhxDr96yyN7MjDpO8rYwh/Hh+4UoweHU+7Dy3
 BS2Y6RrUtfGtymTjDqcc+atiQe9aIqHh+Lhjtp4oCT7ap3o7JQ3C+38sfn2pp9G1OPb2S9I7e7t
 EDwf73lHCBnIUY3akVGPwB/AZgBgD0+YIbgoOa9IC9KMq4wLB5q2+tmQ3+OJBXEmypcRsfd9/GD
 sdsNwsTApTIr9sS2q7UnVxdnMm9XC7kaKyT7ENds94NUkkaXnwLb3FzYGPOBo4GgfzBofCgYQjj
 r6DtyYlHppRxw3AbhMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_185436_139094_0E169A59 
X-CRM114-Status: UNSURE (   7.66  )
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



On 8/3/2026 9:05 AM, Miaoqing Pan wrote:
> ath12k_dp_rx_h_find_link_peer() is no longer referenced anywhere,
> remove the unused helper and its declaration to avoid dead code.
> 
> Tested-on: QCC2072 hw1.0 PCI CI_WLAN.COL.1.0.c2-00229.1-QCACOLSWPL_V1_TO_SILICON-1

is it OK to use engineering build in the Tested-on: tag ?



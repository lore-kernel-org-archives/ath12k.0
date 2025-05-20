Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE651C3DA6D
	for <ath12k@archiver.kernel.org>; Tue, 20 May 2025 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVW1HN4/a6Zx1t9y/+29FG3QqYnDpr07zoTdtPbkx9A=; b=bkRIhC3P5QtfhqniN98DsLvE2W
	9138cBdY7r6a2lqeidAGCNW72hw5H+3CdHMamMPrwrCnaDJNd5xtNI4RxxnF+Nw+TNACfxogR0bBp
	Z3G+8XpU1n1uj82D8P4gqnRqEHMaTl3ZOuS2ZTz/pblUG2z/9xkwLKGytFHigXLI+72f4nngq0TZC
	3y0sJK8HiPsAxIBYGGpnFWkDZRkn81Bdi7jYcW4li8rY1Sqvd6+BDQKgUuooR2nveb+utg1tPu5Ys
	vwXKQun7rlTgg3te7KfOiQKiSeTEy0lhlCsT5jL+76Sb1RQ4S4spvowS+XY9lsodyYqpRxAA9K64P
	u4U1E/wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOYy-0000000DH6t-1U91;
	Tue, 20 May 2025 15:07:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOT7-0000000DG4P-40W1
	for ath12k@lists.infradead.org;
	Tue, 20 May 2025 15:01:27 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K8Lg4B011043
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 15:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NVW1HN4/a6Zx1t9y/+29FG3QqYnDpr07zoTdtPbkx9A=; b=HRzxnmjJQTT2KlLW
	4U4vW9ndK8tzLiguKhNj7w/f6eBzw5fJ10QwANXgMAPED4Uu2y8PPI5PbfoYdhD0
	7A07eV0fnZIlsLk8Vat8u6YKf49TT1TyC6wuQQc93fsOL0VxADFWo/rYwX2SeR7o
	qPo9umoA1MReuz76u132xBi1AK8cyUQNQ5qCz/97DBrDo3mJgEs7iPRWJzqU1U0P
	9tQlcNGW57TDzxfNCpoVeUsUsjq+bXLW/lmMALAtUomYauCK6mHohdl4fvz3Heex
	q+VSPxVBzDD/Ismh8n9Fl9385wriLZIqx1eX5aJCUlyQWNzCjCmQDMMrKdxTv/MG
	hEhDKw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rbt22jkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 May 2025 15:01:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7370e73f690so6920945b3a.3
        for <ath12k@lists.infradead.org>; Tue, 20 May 2025 08:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747753284; x=1748358084;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NVW1HN4/a6Zx1t9y/+29FG3QqYnDpr07zoTdtPbkx9A=;
        b=JglFj/mYygv16yLYswe6YlHd5vCLavKQr8qrFxd/Fr7tqY0jFijqrVvXgcql6SoNxq
         ieh3k095l9Nnw/zfefLImSkW/6nLnG7kAI1qMCDRLszLdzO5kksjfqBkla2uph+gznte
         lVqOi5Iv4LRBdACtl4T3OUL7OJvfDdKH5Fx4SmzPTkU77nXZcIfZjAYGsiQQz3D4Bu4K
         JdMZhFKCTg3jMmQrVH9hJh8V4+xUDD8e/KY5gl3bYiQDzItUbD12VaXtPqS+Tee+z5a1
         808Hlldh8OJ3zuQnwmLI5omAwOi6RunPKz83XAHlRx6BEIrJ8uwi0lQyrhPczuXeq2DF
         RDgw==
X-Gm-Message-State: AOJu0Ywlck9x0yOpeE4opiecyy3YiF6UfaYyz7qyqpVUNn+Ah7Ll0+hX
	YVsHXk74/oAFniEa99iFBfSGFz2DbiTWmzs66/yGWIjJJYed1ZyhMJF3XRVTqpDQLo4/dQ+FWg/
	FZdNSVfUlkmxtIrEOfy74qj8KcFSdqzw+KfC3p4nLLaxT+A9VpHPFVhy3uQFQDdBN
X-Gm-Gg: ASbGncs/9HRWY+fyGcyMLCumK40qSq0m5hUa7QpwH8iUSH28aTp9ZGyOyhCd2DgF/xa
	dWURMwOpWTFgWDmca31Hp9puF1wF8wWUtrTfgrWB0TBiIzCzLX1cFuXjt5tHotlYXDOTdFh+LWi
	z53ybe5e79iAQyTZEH6eDk2/M6SDA269PMFH0ZefH2jf/AbEUo1vEncACC1kzH7LW6ftNc3DATo
	SPPEh3Wwx/FWnvGhq2wabQl1BIYm5ZBt5UxiRKJ6N/MGI8t3FfF44e6XPSjsPbK6As68PjvIlX7
	idyjRdaHB1d7gG5SRCbzyMVwM2oUZCYFwVq25l64hSvWhM3T
X-Received: by 2002:a05:6a00:10c6:b0:740:a52f:9652 with SMTP id d2e1a72fcca58-742a97aa35emr21560799b3a.6.1747753283551;
        Tue, 20 May 2025 08:01:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQAL11R4glAnMVIuS+cl0+A5byXfmxOdflGOSIWjM0YvJU5P/JAG0giWvVQ4ZafL+gvC7paw==
X-Received: by 2002:a05:6a00:10c6:b0:740:a52f:9652 with SMTP id d2e1a72fcca58-742a97aa35emr21560754b3a.6.1747753282973;
        Tue, 20 May 2025 08:01:22 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96e2106sm8264258b3a.17.2025.05.20.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:01:22 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Mohan Kumar G <quic_mkumarg@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Dhanavandhana Kannan <quic_dhanavan1@quicinc.com>
In-Reply-To: <20250505153536.3275145-1-quic_mkumarg@quicinc.com>
References: <20250505153536.3275145-1-quic_mkumarg@quicinc.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Send MCS15 support to
 firmware during peer assoc
Message-Id: <174775328188.1942021.8694986570679072778.b4-ty@oss.qualcomm.com>
Date: Tue, 20 May 2025 08:01:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEyMSBTYWx0ZWRfX0uAX6dGruIle
 eBBW5it3WrHLhiQ1UjAV6/MRfZg9BesJV3fO5Sqolq1hn+9gYUh+hrRlLIIxDPVRaYKZho76t7l
 64xnQlYNDRR/Oyt7gGpa2aKNjI0TseSae1BAfgoMpyBA3ZC5UNPXOF4tkbeHgpLSkaAL1Hfcg4J
 86+4PvnF2cTz76AGubLqLi9REsjg6P3C6JmWkOareIRppu3ReUAIB4+I8rlrbmZuWXuwHTPYfCn
 EUtDuY+V4OBzHHtGSrZZDYhkKjROR2sS2hPCp8RC3+EP5K15qsFBwGc8boHhcNvBPGGocUMAo/G
 tvn57lYQM7Ul9z/W6SdgehogdBrgPat8cc7CdJ+MJ9Ez1pQI5dCHvRGabCMzmF6LJNzUqOoG8GA
 Da9wAc7xn7nYQXUGP/A/OrTrvb2MuZIDqFZ92oTR1L92Y/oLssAJHDJ8zWlaO3tFsR5Ak6la
X-Proofpoint-GUID: IbIJb1JDel5027y99IZZzXWJr4YyGuiA
X-Proofpoint-ORIG-GUID: IbIJb1JDel5027y99IZZzXWJr4YyGuiA
X-Authority-Analysis: v=2.4 cv=dISmmPZb c=1 sm=1 tr=0 ts=682c9944 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KWIm60pxQzOdfeBkbBsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505200121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_080126_002919_BE079359 
X-CRM114-Status: UNSURE (   8.83  )
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


On Mon, 05 May 2025 21:05:36 +0530, Mohan Kumar G wrote:
> As per IEEE 802.11be-2024 - 9.4.2.321, EHT operation element
> contains MCS15 Disable subfield as the sixth bit, which is set when
> MCS15 support is not enabled.
> 
> During association, firmware will use this MCS15 flag to enable or
> disable the reception of PPDU with EHT-MCS15 capability.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Send MCS15 support to firmware during peer assoc
      commit: e66396cd08049ff3ec1a2c4653a5233fc7f323ba

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



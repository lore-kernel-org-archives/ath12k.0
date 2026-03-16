Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC59F30296
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 01:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98Xp3trSyk6WtVDhuSr+iYDxKiQNTLAfq4L/owqfT1o=; b=Pl166kUqe2z3nI22JjcEImsHMn
	eiPvBQU+0Yh/K7h1kmhE++vMGooaHVBKt0Ftwi79I6R5NAJzhsxEYafWpm9GITpdikYp+5PyQUkYQ
	+P70fW7kAHmInLAJSl1HoSu/8R8iYWlz36giA6qK1FT8fFgGEz2s9sbuTlOA6z/ISoOKIoXNHnnYh
	wV0U2zLoFFB++KJqWrpPHrfqRE3T8miFG7hMtC34CDIv5zhumyxORh9laWxHC0h1AX8h1jpuxollm
	whUblbnE1Q5EMmEhVgnFrd9d+3hsFC6pVZwZuYxDeh/7+qj+gNu8DmVNcOxFJjub9h5HJvm4u5E/g
	FheJ63PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xBZ-000000039QG-3Iua;
	Mon, 16 Mar 2026 01:56:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xBW-000000039Px-3M7G
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 01:55:59 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FFjbSj2226559
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 01:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98Xp3trSyk6WtVDhuSr+iYDxKiQNTLAfq4L/owqfT1o=; b=BrQgQLgehe1X1mUh
	Dhjbf3QTGlp+HXXqqNNRPuPfKTB4hd8M8lseQRUUvsShXLxYu3+OjM/B01h/LYdH
	z7riJErIGM0RkE3qDlXmnAY/4yVSaqlz9XIEmPRcEEFwPw5e2K8Qqde2NnJpZ/YD
	L8Y/FrNo8ppm06rpOMiD20oqbzQoLszIkRlutO9AFJF5vBpyNp7DFOCobvE7sFGd
	QqUeaOH1jkg7uLAkHbwy3bjXZQBP+hdZh2P2L7sfUyjUw1j2f8d6E88r3yoLpBlg
	OduTc/Exso/jeCHQ0/JV7p/PvhRgOctqtAfUAuq0OMH1K9f8ETC8C3nUKI+M2+vL
	H7bsTA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0423v15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 01:55:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35842aa350fso29229905a91.0
        for <ath12k@lists.infradead.org>; Sun, 15 Mar 2026 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773626156; x=1774230956; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=98Xp3trSyk6WtVDhuSr+iYDxKiQNTLAfq4L/owqfT1o=;
        b=QB00b525XAJYQr8tdrmBMAYM4bCb9Yyj+TMQI5AXbOnKdwV6cRWcWHgdAQIzYfBFwI
         kFuPr+a4TFlwOL2fblStWQj46lWISSOKcrlv6Zf72mL0G3P0MlIYdRtmJp62faSzT8ng
         QkGNIb4BbA5/0x3zt6QhEQu6MuUFElsTG03aKgXMjAtw0D1Bxbo/H/nIrWcsCi+M1J58
         IgD641DHfDa7tZnJp6vrhCOvrAFL5dcwkOwbu7d0I0qYh1lPgC3yTHGngROKeenVCOEv
         SIktN9FeocCXGJFv+/PjYtogPiVnUN/XfXS+UrvBSRjTdcfnQ3K3RBRGzLXqHcNjjRXw
         GxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773626156; x=1774230956;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98Xp3trSyk6WtVDhuSr+iYDxKiQNTLAfq4L/owqfT1o=;
        b=WQVoDohlZ1WKbZhnTJmlQrAs/IG/PmcV9N13WliUBKg/diSVe47UYEW0nqykKJgzEN
         p/lLcYJkKb9Ne/hXtx83Q0M4NjeOGYn0vOoht7+mPk4zLePo4tFY02fjmkWP1RW5qq8l
         N8+YD3maxpgHqCs72CBspSr25UpTIYm/M0fm07sv/7XdfSIsp3ZMJk5VbYuUFCov2bQ0
         8o2/CyceoedlQSXqBzJLRVWJTJz3TDyZgHMZg8+k3vVu+47FRnuFYcNd0j8hcfZl8lsJ
         AzVUICoIcMy8oyoDBFEQsGJh0IWTGS6LOIBSBbXDOcteAn0abn6rT8oTlzSjHI0CtiKw
         iJHA==
X-Forwarded-Encrypted: i=1; AJvYcCXMfXynKOndRRIFGa632egn+gwEoOKZ9zYPOXw8iuZSbDTNiSttpnsWC2pVPt8CylXqol9VUiA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyUPJk/ZmluyHS0PeOJhrcnlqxoBTnIMq5sljLUzE161sWgbdKO
	OVYn/DFD7pTTLv6FF4IH9b/CFE40VINvN+O1FSNEpVXebHGKstBGV+rN6JcVOn2Nu+cUV4/ONEx
	CqYgPNOObqhhD+g7GGFryAl4Ml29ebMoAy27Mbbpj3TfD0alHy27yqqs3CpDd1dbk
X-Gm-Gg: ATEYQzwNlFAeOVTWili7w2ViuLbkMunT2J+9XsaKFRRrAiiogYx/vc3XgkUz9m4nRzd
	Q48i/upGWXn3zZQ7vKgj0D7hETgQtHS2khERApjYcrbbhiqW3zkkZ2zQf4IALaCn9JCXUNLI7CY
	fo3tnFXsCKhQamyMwvKgKtxECMML4HzYID4hgz8SdXMwX3furQ1u/e4t/tgJZXU5l+Mdj9UJhVb
	Lo0f/8lNuQvTWiiSTeGs0BaBC43eM4NnecGnMNtHLd4uIWjPCsFeU0Vpb1U4OtD4zhAiCyUtkO9
	MZIruy3IsuYOOWRSkxqEFpJ7/ZeSbAB0D96paOJgOP+9xAw3Iv9Mjm4qH1GGLh94WXKdbeSDdiT
	DV4igwxlmXp02MlPu7GR71fa89JxqxBBL/JS4IhVNVBeRpDRoxKb3QJ4T2/YbdGZhpq4jvLH16b
	JWygKPMgUpi4m4BEOLfvM=
X-Received: by 2002:a17:90b:4e8b:b0:35b:a53a:7d08 with SMTP id 98e67ed59e1d1-35ba53a7e81mr360856a91.26.1773626155838;
        Sun, 15 Mar 2026 18:55:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8b:b0:35b:a53a:7d08 with SMTP id 98e67ed59e1d1-35ba53a7e81mr360846a91.26.1773626155398;
        Sun, 15 Mar 2026 18:55:55 -0700 (PDT)
Received: from [10.133.33.128] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a248042d3sm4503351a91.0.2026.03.15.18.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 18:55:54 -0700 (PDT)
Message-ID: <6d481a12-8243-4996-99dc-9fcc5a75b014@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 09:55:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Clean up the WMI Unit Test
 functionality
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAxNCBTYWx0ZWRfX7WVaWkVRrzHo
 Mdbtj/DsuAJEl+++MntgpyL3/IBrTqeYRjbQto1jgCO2gDgVF3GZjtaoev4W14Qedd6uQ4otS46
 3KfLW7z5y7vo+ORh0LooYihTaA0+0tRtME9jysxLj8FaRPENutvMVuJhY7hE7BshUChS+qIfgsP
 x4uASGVZUTECjSx5H6juEE2nQXR9+BjqnVOyPZDFZxzT4m5jKV99hh3BFEZpl7ZsCd47SXCZq8l
 qxVwy5BtvrNFp2IDie1A1cGkAzdgxEfnHacRu+vWIqIFaIs7exfoaGyEZiF5iFQeW9ds7eLK1HJ
 lTIXiFtP1wO17JSP7/OEW/8D7wMowXikmrIf3p+Dnnj7BQ6Bodr8bfdN6d3MvadVQIPPhZDcNSe
 YV0NYz30EleyYhNBTDkjwZfsrd4M/FLnaUUhIiuYlxFf85ZUo7fXZ5/LTa3s1tQB4z/wzZ7NrAz
 byjUE8Yut96Hm0SgxNQ==
X-Proofpoint-GUID: FApSJzH2mb_m9_gSG5me2z2jQ5-yVjKj
X-Authority-Analysis: v=2.4 cv=SJJPlevH c=1 sm=1 tr=0 ts=69b7632c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jYuOhbGHmjOzu_srz9kA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: FApSJzH2mb_m9_gSG5me2z2jQ5-yVjKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_01,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_185558_963442_D30212C6 
X-CRM114-Status: UNSURE (   8.59  )
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



On 3/10/2026 11:16 PM, Jeff Johnson wrote:
> Patch 1 updates the core Unit Test functionality to address multiple
> existing issues, and patch 2 removes unused DFS Unit Test definitions.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: Clean up the WMI Unit Test command interface
>       wifi: ath12k: Remove unused DFS Unit Test definitions
> 
>  drivers/net/wireless/ath/ath12k/wmi.c | 58 ++++++++++++++++-------------------
>  drivers/net/wireless/ath/ath12k/wmi.h | 14 ++++++---
>  2 files changed, 36 insertions(+), 36 deletions(-)
> ---
> base-commit: 9942b3f80f4ebe6852663e0d35ecaf6b7a97c8da
> change-id: 20260305-ath12k-unit-test-cleanup-07622698c994
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

> 



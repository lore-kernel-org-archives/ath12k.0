Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E74D3F283
	for <ath12k@archiver.kernel.org>; Fri, 18 Oct 2024 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtzyPpyoTEN3UDvWYwHTNe83We0wDabg1lie2peb5Eg=; b=fc8CpP0RqZVCyTTrdXNGwx0F6m
	8IASNp6EvWbW/a2phlt5DU78N33Rnij0WYlgCiEaMvVchZIrsM8IUl4s8vwOvBbOaDc0q7kJoqQFh
	4xe782EbSlEfDA8qZrmrTOzOdpyWhZWF+8RQjgKrvlUYkYki1zQtusWqWn31Z5CHcDFrcvixpK8s2
	L+cXQUPV4OOVG5YfT4aDUeXmqDAEMvzlDF7/ReHcbsTc43ZJwxVRXw/ICIBGK+alKdMOxP2IJlLtD
	jPsFx839A9EUoWxXrPDFwx9K2gbOBvqrpM7j/6DXrHaWKKpeHFc9mYhOzapApQzBOYDNMmNqAamZ/
	He9PB1Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1t8Q-00000001sju-0iEt
	for ath12k@archiver.kernel.org;
	Fri, 18 Oct 2024 19:59:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1t81-00000001sex-0Uwi
	for ath12k@lists.infradead.org;
	Fri, 18 Oct 2024 19:59:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49I8Vekc001733
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 19:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtzyPpyoTEN3UDvWYwHTNe83We0wDabg1lie2peb5Eg=; b=Zko4Iu/kP6lkrIxh
	48wssYcseqzJkOr3JL1kOacHpqyKrLt1qmwOCccU3yzF/+SfwqvXsHUu+OuNNaFi
	1TiDOH94nV21XrJtRR0ujvNb+JiYh4xIhmCHV9sbI8aeArnq45MSrmEtt3jJ6yTB
	VQRsJhucQiwFacsHIBrG0e60G7muDZf+XfKgW/G5R+Nch8wsB+6/grQBjtyHGumN
	rRY7JorJtYc5F+H8kA2Qf19JTMI6yT6ZWQQrmAD0pe+U2olzeLFmUol2aCMp0sur
	mhFOJK/RWQ8IsqhmaXuvKLoZmUvK0r7dolbLd4cMQpBQbfDQ3a7Yuyfq83Mp/MT6
	JxFdDg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ajm5fb8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 19:59:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-84fcaad02eeso76512241.3
        for <ath12k@lists.infradead.org>; Fri, 18 Oct 2024 12:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729281555; x=1729886355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtzyPpyoTEN3UDvWYwHTNe83We0wDabg1lie2peb5Eg=;
        b=gxL660953eOANm2msJjuzrsDGgN3o7mDpRGh78zU3CvxWmjTtfYTRJML7SZ3EYcqiD
         nvvYglN62Zu4pBmZ9uUrDwMFOdRJUe1sUFBw9SLcNDaig3ay1vmVdjF0zX/vmJQTvBf/
         cxCjzabzwAvGJpu+HFWslwkInIGxA9U+lJ/y5XfZljPzjiah2kqzBmKnzhfhD5IlavIi
         1V+dUyDKwBCYLZJJnRvhtjf9T4NrjojUHG6pIj3Q7iaA6vQCXP9z49ryX7BGcrwD9SBs
         33qavko+P9PPx9lqWAMzWq33s04tN+im5rwZ6hMpiWvN11Dbml7pUusS+cCuUGHEnQ+Q
         nV4g==
X-Forwarded-Encrypted: i=1; AJvYcCXMqanc+AVcMssuy85XdLwOhHTg0t7HL/TSc7EJqXzV0acXzIq/JbaRhmeOTD1agIha5LdjUgs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdSkvUisI14i7x/CB9mSSkdhasuhnniHfs+FaP0X/r0Rp4xcB9
	HLnx7quUvX0+1LcFMYN3nQhAz31mw7POb+bq7ZHxmvHKf6RbUe5ew1mPEKOkNhDNc1Gm7AvnEa3
	i0jstBSfdVy79+i9rvs1BwgF+eSia2qhsCLJ/spyl7zKZmklstvEbgCthKkOu
X-Received: by 2002:a05:6102:54a8:b0:49b:ef23:7e51 with SMTP id ada2fe7eead31-4a5d6bc803fmr1508788137.6.1729281555371;
        Fri, 18 Oct 2024 12:59:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUOqqLw7SE6fFgn6NiiKUFLQbPuBT4Oy/qN4waDZtdNfBEdyY6hIjCp5xAruGWfN49WHtsZg==
X-Received: by 2002:a05:6102:54a8:b0:49b:ef23:7e51 with SMTP id ada2fe7eead31-4a5d6bc803fmr1508764137.6.1729281554980;
        Fri, 18 Oct 2024 12:59:14 -0700 (PDT)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a8e8b0sm133131866b.42.2024.10.18.12.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2024 12:59:13 -0700 (PDT)
Message-ID: <66244403-373a-42d0-82c0-08127854b41e@oss.qualcomm.com>
Date: Fri, 18 Oct 2024 21:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/22] wifi: ath12k: add ath12k_hw_ring_mask for
 IPQ5332
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        P Praneesh <quic_ppranees@quicinc.com>,
        Balamurugan S <quic_bselvara@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-7-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241015182637.955753-7-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jGiyJB2UCn3UZdi13lxwbap_YwqxZ44p
X-Proofpoint-ORIG-GUID: jGiyJB2UCn3UZdi13lxwbap_YwqxZ44p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=791
 mlxscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_125917_197818_5586C90B 
X-CRM114-Status: UNSURE (   8.75  )
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

On 15.10.2024 8:26 PM, Raj Kumar Bhagat wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>
> 
> Add ath12k_hw_ring_mask for new ath12k AHB based WiFi device IPQ5332.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Co-developed-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Balamurugan S <quic_bselvara@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

Same comment as previous patch, it seems like patch 3 is incomplete
without this and a couple later ones

Konrad


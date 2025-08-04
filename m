Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D9CC87FCB
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 13:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=; b=mjn/DUsD7NA29yjktjfJrm9MV+
	4041PsyiPfOCLFSwOjrdJpaltHidlwkbDh0dRmyBhb5CKihMY4GT4Pk+syilZ5AA5ZPUUs3/HIPqe
	nzGcV8adsfW/crkOp4CwyC/PmBUXVhvMu67YKznCyhZwBfZb2bcwhW1sz57xwGa/1sLd4dI02aPez
	o/cF4FNUZgfwG4kWhGPRVI3jWl2yB6lrP8BlOsTYQy5GHzwmfgD8S0cjNtjEQ0KKbU693DsKYpiK/
	FbtTz/L1SxUtKC8qSAFhtAetF1W419rErPvXoNgXoeeHs8pr1HB8W1etRs0oJlvDObf1hLXchfpFW
	mTeDHafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uivYe-0000000AaIK-2ljr;
	Mon, 04 Aug 2025 13:48:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiv3R-0000000AW0l-2PAz
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 13:16:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5748kXla021762
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 13:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=; b=bFFm/K5lguhDneyS
	WrB0qC9uZnJMCyoyyTzA6D60uGTmBFWV6+ajaDsBYc1M+qeI0hVynRSaVyh8d0HP
	vwUnwNppc377sTEXgSpfUHt03B8qogqY6JbmEouNYZ7fHWrEBd0/gfNw8xSD/prH
	fWYh3kkIGXJxh4p0najhgLrQ/FqojwQwsRctULet+Dj22D296Hxn2OC3IurXQxWr
	yJL/48cqWZoEUdKxG93HmQv9sUkTj8/LIA9wJqBtIHt6TYLpEiZYUT1oNkGz8Zgq
	5IiC9Po82NlTrbgZdOvfdi1ahcQYSoQC0njdkx/BQgF3u/mzPzx22uEuXmiJYxSq
	pgMJMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc5175-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 13:16:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b06ad8dadeso1204381cf.1
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 06:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754313400; x=1754918200;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgXRWKdb8/uIkJlxKRlTEuKqEVXG1EaXlBO5d+CRj9c=;
        b=kANfLMTDHZhrJ0+2iChXFXcFIcDcqB9yjwR+N5gqIS89/H6UTr96rwyKSRyNH0QNL2
         tqNBhHL8WAQwatuR8N14IoqS4Kabuh+uvXru5gTleM2X1PoKaTs/rIAnUfzKbzEQ9fP+
         YL+twhzCmdDhzsXwriV+V2ufpXCn2X+bW+I93TucnVii4GT/OIaYWAmwEBDCBnHUhIVU
         cEiwFE/5//7f5YDMPEPtl4lg5NNDIcvPaTOiF6LYk9g3LhRDcPLuadI05xxpDRlHDpsB
         bfvtm1clURiAP6HYE/wUcmiKboIe/S89hDXcMHvRIpshxm59/YHt9KY0o5MbxhRfB4ag
         cxdw==
X-Forwarded-Encrypted: i=1; AJvYcCUdTCIqOe16KuDmH9bH8PYCwpfyNLeR6g2UogMnMWksUtqxfuJUlokJru6iXrQshXaZZXxx0hk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxHZHOeh7NmkU0kVnUhgQGyeh5/wfvIoiWjFbKj+3qgbK7i9no+
	SkqlfDpNaIIlzylkaSuT5Ge9fypbOezt6QNeJUOCq+GhcYMhqv4INg9hiQmM/e+GJT4AsmiXq5o
	S4uuZFbYbRAA8djJ3apPntYnkg5KYqLek0CrPoaMHxJ8dvbZPfjiCu4zJWkH60ynt
X-Gm-Gg: ASbGncuQyabi1UO9IkQpgI9ivqYy9HnufDn8DUTckUqA/J2oE/YlV0VPuZgwMvoawM8
	o/e94T4ulSFt/XTaoyVrp89H/h/GnMJwOhuAQu0Xmg3wQbjiMXs/Tp3CW8CCF2GknQT7ffS+vX6
	rcesWbszEEAQ9vrzOYnFrW961D6HMQhhsl+IsfYhWq1OcIaP+i3sNermIJUgnM52quJdTWXpQ3X
	kWQN8CqrMDaiwkIiiVTEzaPR31Yf/mHv7/P1giMyZUbzSUMKiJaRH96xWByp7eGrYk/z1zKwODj
	WZyPP/lro/3NJ9FWQl8PGhpOQ4Di/u5cLOTIlVb3C+oSGj6vb25yTmalB3n0quyZHi0otTvBDUW
	vQ5kPWf3U2Pgf66L+3g==
X-Received: by 2002:a05:622a:1211:b0:475:1c59:1748 with SMTP id d75a77b69052e-4af10aa56d2mr63735411cf.11.1754313399505;
        Mon, 04 Aug 2025 06:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf7yZ8n4Kn22sR5Uevb5Blz+Ts3PocLhzk4Ya+jFjCOhrB42Tx4xCPXD1tnN8w3MczWz9xng==
X-Received: by 2002:a05:622a:1211:b0:475:1c59:1748 with SMTP id d75a77b69052e-4af10aa56d2mr63734971cf.11.1754313398788;
        Mon, 04 Aug 2025 06:16:38 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe82a7sm6859797a12.30.2025.08.04.06.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 06:16:38 -0700 (PDT)
Message-ID: <095ab6dd-9b0d-4f58-872a-852c5f19818c@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 15:16:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3d5SbJoYBRYfw0vQ7WT2s7XckmYidO1k
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6890b2b9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3d5SbJoYBRYfw0vQ7WT2s7XckmYidO1k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3MCBTYWx0ZWRfX1dO1xBV0ZrHz
 1G/cOmS8vaZGjo+7TNC1Txl3R/lqVEHBPWVu8du3UszeA4AJNYIATQIsPScvq/eT4hKW8xoaM/+
 cj5uiPxAHmO7UAyVCtDfYx2O4tBxqFtaUpZerkVqpzvboIHTr6WDjN6lNR9j4KJJA5jLVDtYdzE
 hfwg2ZVKb5xzIDViKrcse7dkkytrUVgePkDf0DrZF74CS9QbaCq3eZmaCO2rQ5wVrneB+fd3I4w
 MOWWOVR3Ggn6SUHiwKaFuB+lHWhyhjw6bLuavK1i5zyujXJoGW8P9EaK24Zw9MNjYca+eccM0FO
 bN0N25qBPXy+y++DMwo9ZKMM1inunh6CrD1Fy6GOvI50sVZ77TRgfnASS1TLxx+0exAt7h6C6fX
 J69jlZ+x/P5KxDs9xfrcEiNMpwL8ZaRh1pfYhKxs5Jpmr+u+zs85mNIGDWW9yHcSc1/OS1ZO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_061641_620899_2DE5951D 
X-CRM114-Status: GOOD (  10.91  )
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

On 8/4/25 2:41 PM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

[...]

> -static bool qcom_mdt_bins_are_split(const struct firmware *fw, const char *fw_name)
> +static bool qcom_mdt_bins_are_split(const struct firmware *fw)

This seems unrelated (or at least unmentioned)

Konrad


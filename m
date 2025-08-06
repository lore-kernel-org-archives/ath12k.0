Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D41C87FD3
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLFDFgtgIMICdEJ792w168OyKixfYM5BYvfWCMHrn0A=; b=kEmqDCMcxCHWfIWT4EZu6X2qNn
	aDNhz2mPMmu+cl5noYpcop4IWeHKKZgmns+CLI+NDj4PJbXM+AX6SNUtC2fZ4C5/gXBg4DYBctDW8
	0n+lb/aFm3J0uJx8WBADVJOB2kVR9TN8KO57LqKqpRD2utG/joTlEjZ1cftHO/+ZPX4WOE8Lp/KRl
	cUaN5OKloLlgw4KDSAnH1gBSblEOInI9wO3ZjNUcRpW09pCtTfnuDrtl1FevJ6dCogT0SaICK1jm3
	iAwWP6GguOsrmbAgDtg7YXC+XTBC/O06uW4FPqOUX2VLsPlfOksOjaDUgoRGE8qO1lJCSovHag3AN
	sWNDgmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjTl-0000000GA8k-3Thz;
	Wed, 06 Aug 2025 19:07:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujjTj-0000000GA8C-0L3q
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 19:07:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 576ERjFX003968
	for <ath12k@lists.infradead.org>; Wed, 6 Aug 2025 19:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pLFDFgtgIMICdEJ792w168OyKixfYM5BYvfWCMHrn0A=; b=JeWbuwM7PL0zAmGW
	+VETreTAUCzm2n053JSNWrko8eWL6LoLI1ezrYAhMJtsVrM+wRZeh3pnIl5k8OV0
	IdE5Y4F2MyaevZLKAcQ5sd9PyxGj8JmMvTgHFxoCGMdr6uUrLo2EfuBT6qdkmKYn
	k3+ifV38vlVJr9NPx6atLCZtMVPbTRo4uzBIFc5v56+rn5NAkjd8IoUV+x4CjQJy
	3baZtNqsShLgsD5rEk8GJMOSGW/wvI4FMys+cNtla66buSDnWRjtmeOMbIKleOfw
	k7X1v0BMLkW/ynYrT1WYBtUCTdbD+D157ShPCNbrdk71zyvtHVbk19hHLzU9mLHs
	4P91jg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48c8u20t0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 19:07:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2403c86ff97so1968255ad.1
        for <ath12k@lists.infradead.org>; Wed, 06 Aug 2025 12:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754507228; x=1755112028;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLFDFgtgIMICdEJ792w168OyKixfYM5BYvfWCMHrn0A=;
        b=jTgsBXTZuG138g9Il+gjf/zOKjVO0UhuL1ljWQqyv9LUILtNt6eBPnAkAGX7F28Y52
         grFwuwmBgItWSlXD89MMLT8zd5IqH8Fpdm21T9eRwImmC0qoccn0blPTmCGm8y8V5wm0
         +u3mo6u+g+LhqHzBSEpLxEI3SqtCik43pr17JXs7uc+ESxUH1Ee9yMGBAZC8T6b209uE
         lLqoj4DNJEAtJ/mcorRty2u9BsO3zgf0cX903mOFktW14KiB7ShLC9AdOJFUh8dR7DYj
         Jzg6S0yVuYQVE9yZ3yqX9lMRrV+CWw+4T+tRVKhcVc4vkcjahT7jddHzlH2pPSodJjnt
         v90A==
X-Forwarded-Encrypted: i=1; AJvYcCW+0Arqw/io1tp3/dzZp0vtYUX2+ERW45+n2DXJRTfYyKTDFc9yikzgsRN7jH4Ri/3gXoKy28A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsXb8m4h2cCUcEYSvJULb4t9du+pnqYpCdsTmaOQwAflSbh0TT
	BO8ID28n9BMX4y8IXwp4QgUW8gkZu5FOdOTCuskE3hljVn5+6k0HetxiuycBU0gplXqSIAe/eCN
	qVr+X2zgBE8ehYFMcVQJrN9Y1h7x4kyycx12WFJW4j8q+tsxWSjHF0sKoICG995Us
X-Gm-Gg: ASbGncusg4QePJ8jy+uAW6MHD+QcJO6P42hY4ua3vd1zLm4/OGDGYG/NBxZE9n8GEBF
	dhRULYl1VEKsZMq/zmmvMRpMvKB7187+EzPIhOJUD8S2FTS/tLLe2g7/l1zyHCedSP4U49xwImk
	ib5aySR2rzljwu72HWMDDtUeBNEP4Tm22NuFiXo3KYWyCKJ7PQHhWcY+dVWwBCMSkx7K4BhNZMH
	I87iKyB9rpzxkrjWYdSjqDJWTDu0/m5cy7CYieR9sSTOj9a+gwvaMoeJhOLa4T7GchKiMZV0KGl
	Z7VINVJZ18oU5CEbg1CJlv1nFGdBncDlN47TQiisbNTiwUaWRRj8ncPb7p4MgurLdKNG3dAr/WF
	gLcH+t5YA9fRzIKdYRWJjyyenEjBVojHq
X-Received: by 2002:a17:902:f612:b0:240:469d:beb0 with SMTP id d9443c01a7336-242a0b6fc4cmr58557545ad.31.1754507228340;
        Wed, 06 Aug 2025 12:07:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHw/V0KLHuGmmP97g4XfNxYYUiYQuA+Las853A79Nu5Cd7FLuHDuerRqAPRejldbNHXAC6rXA==
X-Received: by 2002:a17:902:f612:b0:240:469d:beb0 with SMTP id d9443c01a7336-242a0b6fc4cmr58556965ad.31.1754507227919;
        Wed, 06 Aug 2025 12:07:07 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef75bdsm164814515ad.11.2025.08.06.12.07.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 12:07:07 -0700 (PDT)
Message-ID: <c9d761a2-7121-4ce6-84c7-232a6c4ce976@oss.qualcomm.com>
Date: Wed, 6 Aug 2025 12:07:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org
References: <20250806172531.1865088-1-mukesh.ojha@oss.qualcomm.com>
 <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250806172531.1865088-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1IO1HwBk5T2EuHBHkBrDXZuv5GEonq_Q
X-Authority-Analysis: v=2.4 cv=Q/TS452a c=1 sm=1 tr=0 ts=6893a7dd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 1IO1HwBk5T2EuHBHkBrDXZuv5GEonq_Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA5MCBTYWx0ZWRfX/qxiIgvCcfUd
 i2Zydvc/3bzrM/g05va109CDYgSKaS95JDoXkCFnyKpQdC8/2gQURdJdh5wOq3zWdwdiUdm56kM
 jsBsL64R/k2MidUXZ8pVJzEshyPA/5W+lC1cie8GqTfxRGpAyzsQ5EszE4WKwoRU1HCL0FYt3Mm
 LPBOYUxG+q4JGPE7OBCuyCCblhCB4INcjztyXoELYla3EclRw7MvxcCJe6j8eu+z3paAZiNB/Vl
 8SAOc4MDxRlJsWWwKXsJbiDSr1qx9Xx9/EVlESCO0M/zNA+5PgSlSQfKn5o9ftmQamoG3kejqRo
 +qp9NL5Rfg4Xw3RGGrby8ol1VyKXfyDEEbFR3nLTzrZhEypIkuJfqANrz30Pj+VtGRB2AI0+uxe
 LvMayMro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_04,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_120711_130961_46CB46F9 
X-CRM114-Status: GOOD (  12.70  )
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

On 8/6/2025 10:25 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
...> @@ -353,7 +353,7 @@ static int __qcom_mdt_load(struct device *dev, const
struct firmware *fw,
>  	if (!mdt_header_valid(fw))
>  		return -EINVAL;
>  
> -	is_split = qcom_mdt_bins_are_split(fw, fw_name);
> +	is_split = qcom_mdt_bins_are_split(fw);

this should be in the 4/4 patch



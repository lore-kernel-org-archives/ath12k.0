Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E51EC87FCB
	for <ath12k@archiver.kernel.org>; Mon,  4 Aug 2025 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gvpm8a+Po3AvQHyqTVypgq8YhFb8qXLB0jdSvQ5uttg=; b=AvtRRpt6vB5hOnrpFpcrqtGB3m
	KFpDipfuGxwj3To0ocfAvXK7kt+LoASgfVEbINrRXBYeuqDP7pTN2S7WrIAr2CJDLp1riWZTwYIFz
	hb7GrvYmTDcsLMjjNdxJ5BiYdt0EvsKxli2OIzowRK5MkukGfX0g/NRB7ti+sAgKp85TeCOFAuNcH
	CLB8J1Q+1A8eZOran6PtUK+rhACdAO95y9W9rBGEOn/LGXcSbIi7lNzSAd6NPHx8zP3qzreH2LfUu
	MK84XLHnENKMx8tcR8kGicvSI8yA7GziuilYsWhv/Wca5upIN9Avtx4nf2fyNd4fL5m5NEfNytVVl
	MhWQatBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwf7-0000000AjKn-3XUX;
	Mon, 04 Aug 2025 14:59:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiw05-0000000Adoc-1IIt
	for ath12k@lists.infradead.org;
	Mon, 04 Aug 2025 14:17:18 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5749Qe60027099
	for <ath12k@lists.infradead.org>; Mon, 4 Aug 2025 14:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gvpm8a+Po3AvQHyqTVypgq8YhFb8qXLB0jdSvQ5uttg=; b=FbNECHKSPMlvxaR8
	+1TSgffV1F63Cw3pBysSRWE9dSLwjhlmI38dZO7d5+Jqc0QI3LNC71UP5oyfzjtH
	U7xCmKbE7z7Too77s3Y6z8NNOyMJcQ7++P/yiPnavxDkEFpZWazXr7HJr3jYh+Lq
	J++xkirzs7DGhQgqnzB0Lj5JhSjnmjWQ4XfL0Oq6giJowZ4arispTlZdSwPiCQy0
	4f91W0VNc4vW4j5/6+I2wTwn5W0McWr0FiCjhBr9rSQbqSxViluw4/UbwXOhjAby
	P/tR6sbAV3I1rMbRakVDTzel2h8rhXk98hp0G2ZSpOGGJaan8/2OnyF3rpZb70XU
	ALC5OQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899pad9pr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 14:17:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fd831def4so34320765ad.3
        for <ath12k@lists.infradead.org>; Mon, 04 Aug 2025 07:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754317026; x=1754921826;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gvpm8a+Po3AvQHyqTVypgq8YhFb8qXLB0jdSvQ5uttg=;
        b=lUDdTUs2wz8R3N9wxXfpnXNDjRg6uiVsr38HRDwpk9hotbZNWxuBOUo+w4kayZPmYv
         J5VImQS77VoPAaneWPhs3125Q64+DoysJMQNZDyZch+S0LDt8+0+DFAUdUoJ7GfVCg2T
         Gl47Pw+AxiGmElX/PpNm5XgEo8lqnsjujJ9OnkQY0WcN5Lq/9Y3Za49+n6Bg6kc1d76v
         H7f2AZZcoIlQdCCxcxVEiVLtP2gBoMOmJvPDgPSaviemMWFke2Ib4e5zMXdirr9z7aPP
         mVWDQ7F5yCH2CONDmzCYYO3nsmYd4kC7tW8NCoyPozWZaAIgowB3DNyPX5GeZ95/f6rT
         PauQ==
X-Forwarded-Encrypted: i=1; AJvYcCWywjCDJFZCaPay8W7A5YaBcrriBT+EROO9otrykLLI9FNBRVcis6NFUEoBcvTUDreKBqbIh4M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqhJtHwhWNi7cWvxxvPZtl03JQl4vXEE2ZAgis4MnXo7tl3mrp
	WfUDcras4XlyavFHxZGOwGnJH4ZROEL3JQuw0VaqOjBregMoxrqbhU1fmnJgyDMp+pyP5EUTjLJ
	oroJyGzXMsj4NeeHPOH5q2Qk8GohLNGeEeV7cqN56u+YLH+Z5edLm6VS9TMjvheCY
X-Gm-Gg: ASbGncsAUW3+6luj+Msbf/WYXZns/M2VEfMQ0wqiGtDVg4vW14f8atpzuYFs1V2IpIw
	edIEX0hGktUInNld6gxKco3SZNO9xGbXoKw/6sVU6t8mQHo14UVjSpAOFsxLHxqWFP1Q9fhg6OL
	nDduDTtL+Zd0A4jii/NvprPdO/qrNTqpxG18ACG3owBa3YY9r1qMgJ8o1vEERdX77f/r7W35kYz
	nP1MdNJDr/vblg3VxISyDyB+UCpvEt5GE3zs6ZsrckQjYlFrtKacQCjzE+BU0wkNpZSU67Tn2xW
	WLEuMQw6l/nnymU2BYjtm526/699gl8gBEPhvbQyLKGp+OFTxvAFrfus6qafT3RLn2EH4YM9MO2
	NWWGd/HfisHBO0gbP7GwWh1/MKrfo32We
X-Received: by 2002:a17:902:ef45:b0:240:3dea:b269 with SMTP id d9443c01a7336-24247033fc0mr139082445ad.48.1754317025754;
        Mon, 04 Aug 2025 07:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHaeEa9NWdmU9v/K3+J+uYiBAHxa0ZMd4TXiIz+8nIet/FavC5/MvKeVD+zMUzhg/+SbvBVg==
X-Received: by 2002:a17:902:ef45:b0:240:3dea:b269 with SMTP id d9443c01a7336-24247033fc0mr139081745ad.48.1754317025156;
        Mon, 04 Aug 2025 07:17:05 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a81fsm110766825ad.120.2025.08.04.07.17.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 07:17:04 -0700 (PDT)
Message-ID: <658d7d55-fd5e-42cb-bc5d-abcc0b47a168@oss.qualcomm.com>
Date: Mon, 4 Aug 2025 07:17:02 -0700
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
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDA3OSBTYWx0ZWRfX2znyv78QlhKc
 skigXLsNOU31pRuOj84Am9N12bblEpflLaONhvgluLJpbqI8CMNOvSJE7MSWxX+fLSnOxPufHtB
 9mscXLg/rjXCIoKVdxwSe1mabI8mU91ZtpFjY10+gnXyrAswHaj3nRJnLQC0/savYKo6rD0HHJb
 FA3MLnip8jGIwdHdMojKVYs4Hqf57qQE4dl3nGx4DCd8gZa8nP4VeKCMcGd1F08JAKFOiQzF0Og
 4gIXVR/gKONfXQF6jIvoLHoJ6S2DCs9NZCbQczshZ/kWPX2VT0c4YGshY4vRQou+RZ8g4c4XM2Y
 oDnS2KxVislXm3UqaQQp6n6Cv8cOmDpk0ly1LG+B65tM0+4MRgTy/BVEpuDt9P6yaOSwXkdaOfJ
 DAheHTVKy9lM1UYeOjQjV/KHy0x0VmAFLQfibtrRE3g4DtKIs/xa3D/rNN0qW3RRY6AGrJk2
X-Proofpoint-GUID: ieL5N7UQM0cHwZybA5kXnv8-lHWV5gSO
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=6890c0eb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: ieL5N7UQM0cHwZybA5kXnv8-lHWV5gSO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_06,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=966 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_071717_457166_B534E9F9 
X-CRM114-Status: GOOD (  14.49  )
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

On 8/4/2025 5:41 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
>  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
>  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
>  drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
>  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
>  7 files changed, 17 insertions(+), 21 deletions(-)

Since this patch touches files which go through different maintainers, do you
have a plan on how this will be merged?

I can ack the drivers/net/wireless/ath change once I know how it will be handled.

/jeff


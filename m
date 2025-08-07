Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D065C87FCA
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 13:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4bMHXUEWO9j3LsN7dUEww8s9G0HlpeNdFt7tEVo1/4=; b=BkxORteuiJFdaa9Iuf/u+vzY54
	NZDT81GdUS3U3SutZtiSQApFFJD6Ka9dF3B6SdsKDs6gR2g2cfuRAp7pPj5PkZksP//DzBDBbuZOO
	70bmSVEC8XO4IvT0CzH6zawjmOU6nCvDr6Di9ePXRvurrMWsASYEBi9icyf/FQovmWS3wU6Qy1fdM
	MdnqzOenlsFseR167crWR7n0kLNvdwV1mkC/VrQf1j7lpWuEPiPYuQVoD/EMGbVnWEJmMSX4Lyeky
	7UfmX6FNNTMKRp9Ouz0SfuCaeV7TCarMA16JgechDUcqkyDuTJ3eGxtoRUi6NQi+d7GSRog/ICaEx
	uuES3VTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0Jn-00000000drr-3vT0;
	Thu, 07 Aug 2025 13:06:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0A2-00000000cGo-1Mfn
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 12:55:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CvOc007842
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 12:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4bMHXUEWO9j3LsN7dUEww8s9G0HlpeNdFt7tEVo1/4=; b=XZ5kBhJBZCEgPH7H
	gzINhwRyPPxJbU7Yw1GDvZN1Puxr6n2Pe7YVYSr2JdeBee2FkZugEuQLwjZXBKax
	u8LoQ8Lulo2l+7gPreA7Jw8hhyY3dOaP1F++R+jQJKZWGHapg9p8uvayZoo9x8TK
	9tRWYPFfz4jZhlbe5heY6sg/BhURBbvPL0WjlVJNeumEa54aq6qlN5HWLt99bhra
	Ref7HJ52p5OkSb7wpZ2p2ZgZgElLIaggwfEmqq7Hv2Zgnpz46GLiYaKmigC5q1/t
	Y/Ek0jhNN2PKwd/gqITedJLJVqwp+JeVVjj//SUAg/R4xxzUDpkgjzash2QNRtnT
	mWtjbA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6xaf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 12:55:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b067cb154eso2371361cf.0
        for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 05:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754571356; x=1755176156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4bMHXUEWO9j3LsN7dUEww8s9G0HlpeNdFt7tEVo1/4=;
        b=ZlO2mjcF5WojGm1lXF1XD+RGpm4n09IrEW2xq/OhKllTbKZkuyRHZIw/RA6oYyNTQP
         YHrLTo8ixLQ6d5lK7wR/rl1yDP2oQ0YHCSymS7Onnlm4NyPPFgT6UPliIZUWPpXl8iug
         OmL9hwOoseyLQy48tAkBOdsHG+GBiq8H8gQZsTiPgdJP2zlmlvKJAGJMQqEVGoRRX+0r
         HvmhdcjLLSYEM7CN6xSdVO2KjXpUppRiZP9ZWxfV000qFaE4f7iU6fEvtl/K62BBc+wV
         /yZTal8MDHvbo/T6h9QPKU9N3HoL17RBxGQGnSfmHiBWXLDIcBXgXd4FmBKAgQOwMf12
         82Nw==
X-Forwarded-Encrypted: i=1; AJvYcCW1JgesfCyFccqKvmc6CouZMwP6jwa71yayP3opCXwv7XeojwqDj/WSqH800vtsz38uruZPzwE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJIXIr4aSo6gC+RL32dLmhcXRTP1eKEnuhwnlI+axP3VnDa5qO
	YwVndhPfoK2NGVU82qsbEvKWhG9ORhe5Ift4QozixhHAzmz5NpJ9xbD2c5xnj0UJ80VkDKLbOJN
	CNxtME/7FaES5Qh4dQmHl8++7YJoCvGi+E26064ZKgCqWhV+Oph7V1nxHeLa5Aj8a
X-Gm-Gg: ASbGncsVHFVcNOoOCWJZjLCk7SDFjBTV3PsBFx2ZTDQLvNU9W3p6VPALjVJ4pC0hYVL
	YmCuMcChWgUx3mueDMFNVLS1XChAg1a9e6y20PO9D35aspAYxlhk/Y/vIiCJure8LTtOpzTkJ3V
	DHv9oRExKmE9fzHQDU+WeKqBimr0kMI4Y2JeoMrIhBc9scJ5l46wY4EtRUWZLPFKS4J2FQIwJZf
	vIix/yaIcrJrXTpfimLJa+hjaxuBnL8OW/N9I+Cypac2IvK8+sZlFAcvCb56gitrR/LO5FOm12X
	NrOyQav/ZwaV2Q6VhTHpOUtUe/jntqs5Xh7rcjhTGowIddJDnqGKaPQHa/UV0yfYhXY2zPwGHuj
	vo6s/BTtHnymEX6VOvw==
X-Received: by 2002:a05:622a:1aa3:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0915d7c31mr41550041cf.12.1754571356129;
        Thu, 07 Aug 2025 05:55:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwbcsceg5/p61lAf2t1TB1KGC8pzQd5z817hJbPD8siowrxZQPY7hCXLhIuHIXx+wUv8hceQ==
X-Received: by 2002:a05:622a:1aa3:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4b0915d7c31mr41549941cf.12.1754571355647;
        Thu, 07 Aug 2025 05:55:55 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm1298236866b.117.2025.08.07.05.55.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 05:55:55 -0700 (PDT)
Message-ID: <38534c32-7e37-445c-893d-3624bb59981b@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
 <20250807074311.2381713-2-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250807074311.2381713-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3G0FxST5jJHGemkW610w81NCGEi8UEey
X-Proofpoint-GUID: 3G0FxST5jJHGemkW610w81NCGEi8UEey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXzl5LJxVZao+A
 T9tmnvPJ7aVRn1kRfzvj6Kx8VE30QTxshFT63TJ3hQFSOt2nrBnvf+QnIXc7Mnu8PHUQlrj/SCX
 6ZTDboSy8wtZMCEg0jeP8SUhD7WABks7/5SaOR/+ANE7+PPc2CKqpzozOZlKzavvASLNzDEzGUm
 xKs5wea+LkT4C6BRDya4qZE8MCv/4YOCIvvc1C1KgD0t7Myxh2csYycsdPOrGrZkYD29zkn8p0w
 7ttq6nrMSUe/Qg+T6zP52TBUYlW2iUwwI3pI+rOfZz0rFhrGpe5RRyhrGL5RWGO5y8OuD+z/1iz
 DoAW40RoayvpUlhrYq3gwu3aF/ppmu59A0JeI52/7sYU2W8AxSjP4EO8UgkDEkn8j1O/YNap9PQ
 ATR759l8
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=6894a25d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IDvrs2r2PCma8_SM7s4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_055558_371663_4D8CC923 
X-CRM114-Status: UNSURE (   9.81  )
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

On 8/7/25 9:43 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/ath12k/ahb.c
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


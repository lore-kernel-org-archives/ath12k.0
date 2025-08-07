Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30639C87FCF
	for <ath12k@archiver.kernel.org>; Thu,  7 Aug 2025 11:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=; b=mz6myBvlO/pIxoSvaG1DYmvQGj
	yGUY38t965Uw8EIkKtalzKMQLvGhdQaktNA5xUJ8NEHWosatwBLQQyUT+Xl5ViExeBha9+9WNFj3G
	eL9M+N9kwB78Z275VJz08it2vf1jAzG+u2uesqR50fSKouU3mtgeZm9s7FFUaSzfz2eRKihQR1k6u
	fJBr0kq/Vu1U9a5VsviAbSbBKGHxS5fjZJeC9RQZTSAljCJj1puahC1pSggkQ0HFQFuG5gHWodg8c
	rFrbQORRgK9oxswQb61dSn1gB+4gBt14TKhIkIPvnmE4WIoIiYoozEuBV9AImT/r4OLCz/RDg1mqz
	6XYx4O0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyst-00000000OAy-3ZTT;
	Thu, 07 Aug 2025 11:34:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujyW8-00000000Kqf-3DTT
	for ath12k@lists.infradead.org;
	Thu, 07 Aug 2025 11:10:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5779CtaQ022422
	for <ath12k@lists.infradead.org>; Thu, 7 Aug 2025 11:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=; b=Fw4D04EpYVpdxFyC
	bM2AUmSmJA8+WxuGhswRdnZ39HAZ6qQuifSBmNHcr00zA5bo/oUZY5N4kG6fpODd
	Lzov9pK6fQyujbnQzGgZVhLgecEVgWV0cK/U182my6Yy1h83r1RDH6I4e4MP4rrD
	oPiGYhHpT4Ox4ql1MahzP/pUDZPM1oQaaVB2ja2+vB++Oyj/CRnQVMkLEbmypAaE
	erWiCb2JOYsjxt5Pzk9izkG87OqaHRvNDRm3lSGV9Epa0m25eVC2Z54n/lJvRGOD
	V4XXNixo1gVRuLBmZfXARCGIUcbcya6LRtBHZK+pAXvp23IWqMccuUgP69/PwBDX
	40yaZg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48cs5n8b6t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 11:10:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f539358795so2682586d6.3
        for <ath12k@lists.infradead.org>; Thu, 07 Aug 2025 04:10:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754565038; x=1755169838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6QbTd5oBtfokcdGnfaL3ss1dZtp3HHu7abxC5K6Xgs=;
        b=TwflprNZt6ta0hUbq5UMZZWfTVdehEum3mrlqjFnVDMLrE1i8nGhFFJLraoDb7DskP
         e3OLiAYjRMpntegwpC7ToVp6ae1qHpHHXAMZ/5yaftyarW4Vzwy8x83fnlrWpT20QJOE
         uXqLVU6riN61cb8FxANq8/zJusP0xrcacHNTg25molag9JE3JPs5d4UqcyCqGldSop7A
         8KCUCrdCq36FvKuJej9KXJ6gYDDrAHmMm7tDXIqt8xfblLtm4m+5avP+SQFRINNhTrQ8
         R66d7Y10LToHit+31pn72+11YaKnViJ9U7hgJgUvo5vqhZ+0IyELLfj5Whwb7NFS6QBQ
         okAg==
X-Forwarded-Encrypted: i=1; AJvYcCVPcFhiK7hqM9M19S63LmQiqhSkT5HnZJHHLzUUeEF5Iwes27a+pk+zXzPUyDE/MEHvliwwYPo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjmzvNbxfva+w7Y19mtoq8iduxkP1eiidDWpRaPqFYzL5xClyQ
	txpyFUeqLYsFNig45+R5fT2YUOGaxRWA+P0Nc0H4xd1sc12EPY27Xb8hNiiUjea0jQdb20tyDZA
	YueVvoNe85qJqn3sW0ZMBOXuInRJx3pr8xsdY4B8Eqf9xkwxKwm3rY0QLh8gkejJz
X-Gm-Gg: ASbGncsTdHhqmnXd0gOdR0pZ/jrVXpUditGcez+xtbkbo6aHdd8fewAKcjvygCGnAXB
	cEzeIc/s6CVggkRAQQcaIyuXDAtbA6S/4ppAYMKJkN0KNOeRbnIKy5OS7S5rtI7hwRlOMs7K4sc
	EwfR7LK9/+NLv7bQgtBw9tu6Tbz/yE8WV6GWLGYjeTklu9yql1d889G0+CIskMUn5vxt+HKARwY
	e0NeN/+TLOT+uu3koI8b8nRumoRW82bqjz0gJJ6wKOFDbLSW6Pmb3rYYRkAbCnC25hGUfsGIK3i
	Uu1s1nl1F+KoGM8Lu6lKGUmMySFDGfGFjVfoLWjvJFuJaFFWWGfnlUxvl22wMjJaVwKsmmNnKgK
	dq4kqgf82EA0V0pxX0Q==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr45527211cf.6.1754565038618;
        Thu, 07 Aug 2025 04:10:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0EgQGvuGZuwaUug6DIZAl5YiLhPSTetS5nLC8plJAjvhb/juDcAiunqpwFSjSp5lL0p+Glw==
X-Received: by 2002:ac8:7e83:0:b0:4ab:67a3:ec09 with SMTP id d75a77b69052e-4b0913bb1c0mr45526901cf.6.1754565037949;
        Thu, 07 Aug 2025 04:10:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c099sm1288976466b.108.2025.08.07.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 04:10:37 -0700 (PDT)
Message-ID: <f6432247-7455-417e-9bf4-068b564461ba@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 13:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v3 3/3] soc: qcom: mdt_loader: Remove unused parameter
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
 <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250807074311.2381713-3-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Q+XS452a c=1 sm=1 tr=0 ts=689489b0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=NyTICe1PHtTOfF-B13wA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: F7clY_MBbY2u4AwmpkkQ84WsiN-mlhMG
X-Proofpoint-ORIG-GUID: F7clY_MBbY2u4AwmpkkQ84WsiN-mlhMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA3MDA2OSBTYWx0ZWRfX95yYWVOewjqb
 SjzsCgpeh/0aEOhaHXzq8Jo5wKRcOkPgxqkjz6osgK2XDrQ4+GtQX17PoOP2CS4Zylxccmfrwfq
 gzpM1NCEIlu7dMeqqmijZnOs2Tw3ZPFxUZQlKctli74SqHAX3k8Pisqsff1FEmpsfvJLMZZEy2c
 FW8E2PjTELd4PlOZx+dfD0gmaL8zdyUEuKc4ChOa3rsIEDWlsYSAqoCXIoZ1sMLFwtIa88eTqAE
 s8aPp4ATqAgA6b7AbYgSf2ccxv0ePr2fnrujXOCDs+OEiBWeT3lqc+mdUTe2ekjHnm0tbzS42n1
 SALedkM4dBHwdl3DOHRwOILx6kp6UpFHG62ay85fUVFO1aqOLe0l4qbUmtPGws1Zypw/ZFfJpDP
 oMk0A3wI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508070069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_041040_813493_0BCB1345 
X-CRM114-Status: UNSURE (   8.69  )
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
> fw_name in qcom_mdt_bins_are_split() seems unused now, it may have
> used in the past for logging it but due to code refactor this parameter
> is unused now.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA39C54E41
	for <ath12k@archiver.kernel.org>; Thu, 29 Feb 2024 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAViczRPJ5p+qxS5ox44uEAe0IBDf8zmhXVvPisl9iA=; b=fxGMjgJhloUob54htJDwtPvA0c
	UUbW7l9KjjmanySwVrtkdB6EOjnjwsyGQP6eobcJ21dcHexoBDESZXxZImX6l5PY0xnvE6b1DrRbT
	pUWbHAvY1IVzIgi1OaE1rk3Ns60j9SOoFv9/g/ChWHo3pZIx9pLKW0WcVKS7+cOd7kdMuCMG8+qGG
	yDQVfhcY1iE0G3ra6YJKD3Ttyz3n03MwrEj91cST5zuhWM9OrtaAzq52Y1fExafr4melh+zczpLKv
	0YVOIMaWUcT4YjAjO4fixk/Jj3f6L0KUpZ2LAw5aqw2eoLZTE84bTs5qf/Co1J1d47BtATruPp6SM
	Iamxp8+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfitU-0000000ECNw-3VCe
	for ath12k@archiver.kernel.org;
	Thu, 29 Feb 2024 16:04:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfitS-0000000ECMo-1dCp
	for ath12k@lists.infradead.org;
	Thu, 29 Feb 2024 16:04:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41TEtSpp005400;
	Thu, 29 Feb 2024 16:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mAViczRPJ5p+qxS5ox44uEAe0IBDf8zmhXVvPisl9iA=; b=cX
	HIvJzqogtTJab44ncCjrUXHVBrLYMSqyiUzqPG749rPx0LrL6eaFPCAOcl1pXxYR
	LeE2yp1+ya4mw4eZ73EPswJb+/UD2zrFYlc8joYdZXdl2W+jb1MtVWYDyF9XXg3q
	JsmGTN9F59JUh0CIew+NbpNh6bk4IeA65JYcc3i+QqUo1qIoQSpNUh3QbBtsPz7v
	ittHyBU1dgqNg5EGtpNce5qxLpdD16NXGNIKlclwKbaGvhYgP5J43THPEMdSRyqu
	5kanaEmLMKQI7h/Kjgz8hf3xctKq6C3D+PcDTWQK8X5V3t7B9uubSxeAmb6sTokb
	48jxjxVPp3pKh2yI2XOg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wjkkq9ng0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 16:04:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41TG4Fqw009390
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 16:04:15 GMT
Received: from [10.110.42.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 29 Feb
 2024 08:04:15 -0800
Message-ID: <3ce6c8f8-e009-433c-9a22-5dfc75388726@quicinc.com>
Date: Thu, 29 Feb 2024 08:04:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Multiple Qualcomm Hamilton cards on same host - none working
Content-Language: en-US
To: david Atkins <david@3adesign.co.uk>, Kalle Valo <kvalo@kernel.org>
CC: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <LO0P123MB40577FE30E1B6D72A554624BD6452@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <87a5ocqzil.fsf@kernel.org>
 <LO0P123MB40574FC63D7EF7424ADB5589D65F2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <LO0P123MB40574FC63D7EF7424ADB5589D65F2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vTVwgiMefVh5z74hfnT0EvbkE6lbS92n
X-Proofpoint-GUID: vTVwgiMefVh5z74hfnT0EvbkE6lbS92n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-29_02,2024-02-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402290123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_080422_578891_28463750 
X-CRM114-Status: GOOD (  12.57  )
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

On 2/28/2024 11:21 PM, david Atkins wrote:
> Hi,
> 
> Update on this, with an Intel CPU the first NIC is found but the second fails so slightly different behaviour, I'll update bug registered with logs

FYI on Linux Kernel mailing lists it is preferred to either have
interleaved or bottom-posted responses.
<https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interleaved-replies-in-email-discussions>

> 
> I note there was a patch with a comment:
> 
> " * support having multiple identical PCI devices (firmware needs to
>   have ATH12K_FW_FEATURE_MULTI_QRTR_ID) "
> 
> would this address the issue? and is the updated firmware available?

New firmware would be required. Kalle and I are actively working with
the firmware team to get updated firmware posted publicly.

> In discussion with Qualcomm this week I think understood from them that the ath12k driver will not support Wi-Fi 7 in its current form, is this correct?

The current driver has support for some of the WiFi 7 features but the
major addition, multi-link operation, is not currently available.



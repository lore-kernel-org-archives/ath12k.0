Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C849C54E58
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7kTbI8z9ERgQM+n83yICsDSxAcqMXkpamDhsVmFRyQ=; b=k/XiiFgiPEiIQSDNHUKbbR9/2s
	NtcH62jXT73rffwIJWtl9TAMn6o9WjaPzVEp77PaJFC9Qrc4s5o0ZIJoVf6pHcPHZYwn4xuOq7d70
	BkirBxtW/Dwsx0Lm/JQ6rFAwdCirkrQ6opczxRgA3/nTdGdBOvlpMOLCnPap7b1JOf1DGLpqatxIX
	wgtZJZvxiKQXuznPwEPjXAy25Ld6kbDExG4f/sViVFdDIwxO5hgsG5P53BwoY+4fw4k7lgMqkGyCi
	Ys0OKH/nvdqWLhY0i9PAqxHhvGciQlaPxzeVnST8h5118rXGDZK8JPQjsLNOP4c+SX4A0VHKKtQ/s
	2vfnDpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnMtr-00000004E3g-3v89
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 18:12:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnMte-00000004E1j-1HoK
	for ath12k@lists.infradead.org;
	Thu, 21 Mar 2024 18:12:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LEAWLl031106;
	Thu, 21 Mar 2024 18:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=F7kTbI8z9ERgQM+n83yICsDSxAcqMXkpamDhsVmFRyQ=; b=mf
	L35n5FKCHxt0ELTxexOVY7+Vvw+lkh4a2KIqplyDZbQ0hKwTZ3a8Z/OznKVJBRjD
	5xsBf9WUvroIv6VBPnSalrRVgqZ9cn7kGzJVlJ4lMfE0NaenrJxhBQp6fhDVfr98
	aAQ7ae4w7Ixh0pwl81kPrnHy7hndBpPhF19dvVCLDy/2ZVyl1+fyyTkTRQWaND2o
	6sPBCHmCUlwsHnnGN1fq4kpX7yaQbGTU/tduscyMQ9DBOxRGqXUrBRjtkyznta2u
	NlpMWrsS36IliK4fbguL8vfYspsBvYMABj6FWWj0GZViJNMhS3ZcB+OmJ72RN4ye
	P/LRjoYTa1zJtzi933gw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0pe2rq23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 18:12:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LIC3d9025935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 18:12:03 GMT
Received: from [10.110.74.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 11:12:02 -0700
Message-ID: <f077d1cb-2704-42fe-a77d-b23d0d38a8fa@quicinc.com>
Date: Thu, 21 Mar 2024 11:12:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: driver does not show tx bitrate
Content-Language: en-US
To: Owen Mesh. <owen.mesh@gmail.com>, Lingbo Kong <quic_lingbok@quicinc.com>
CC: <ath12k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
References: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
 <87sf0kan7d.fsf@kernel.org>
 <CAHohoUh9nt06n_eqFwVf3k6vbqJb5akxvgS4i8sNHpadDzUOEA@mail.gmail.com>
 <CAHohoUjMaNfhhDoJtNh=8zpzKvAChw89WocBFGxhP3Pi_i21Hg@mail.gmail.com>
 <CAHohoUgC34=x9Uq5E8a7nnqkGWRjKpir8=ZFC_XCtEF+Cgzcfw@mail.gmail.com>
 <158ebe88-2394-4b1c-8d32-9d8509c11a90@quicinc.com>
 <CAHohoUjSQdLYt+tSBzNO6LzGgEZcz5E-3WB=xYngE5URveX0XA@mail.gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <CAHohoUjSQdLYt+tSBzNO6LzGgEZcz5E-3WB=xYngE5URveX0XA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rQQh2QzdPFnn65px9xb2XTniOlG6cBvY
X-Proofpoint-ORIG-GUID: rQQh2QzdPFnn65px9xb2XTniOlG6cBvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_11,2024-03-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxlogscore=912 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_111210_557239_973F5FE5 
X-CRM114-Status: UNSURE (   9.25  )
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

On 3/20/2024 11:33 PM, Owen Mesh. wrote:
> Thanks!
> 
> I applied this patch.
> It looks great for my configuration/platform!
> 
> iw now shows 802.11be tx and rx bitrates:
> 
> iw dev wlp6s0 link
> Connected to d4:da:21:a8:06:7e (on wlp6s0)
>     SSID: NETGEAR65
>     freq: 5805.0
>     RX: 36791 bytes (185 packets)
>     TX: 9111 bytes (73 packets)
>     signal: -27 dBm
>     rx bitrate: 1801.4 MBit/s 80MHz EHT-MCS 11 EHT-NSS 3 EHT-GI 0
>     tx bitrate: 1200.9 MBit/s 80MHz EHT-MCS 11 EHT-NSS 2 EHT-GI 0
> 
>     bss flags: short-slot-time
>     dtim period: 1
>     beacon int: 100
> 
> Best regards

Is it OK to add the following to the final commit:
Tested-by: Owen Mesh <owen.mesh@gmail.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B92FC47258
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 17:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbz0STMp3gpCuAR16yXEzVYjez+tdhhb3KZgr/5EdQg=; b=yMkp65aWhcVCCQiRDwLWvEZ4hC
	LynjT0oaeZPgAjUsFDgUODqm3Y2LItWRHkrbGzUKiaXbid1SrprYpucSoaOLLnePCnC0GST6864hu
	5GpvadRMwiRrrCW4d1xlUx2IIpJJXhGt1FTrS6hNhpxR9WGKAiYOagU/qHBAOnWrNSyx5m+7BzPHd
	HbeWGJ1z98/Td9VyfoSWbqW6DZb8W64IiBsYmwW/2WWmMz2KRYHKZ8omIJU2A4sYJovF5nvLQPNC3
	9WUD+q+wkEYzsSSMbe3Y7GCBVHz511YHudfEVwqyju7mFFYBmRFljLicI2mr0VE36J9E9yiBbvNiS
	fz7RXuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOL8C-003RaE-35
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 17:15:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOL8A-003RYy-17
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 17:15:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CGSSGf005629;
	Fri, 12 Jan 2024 17:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=rbz0STMp3gpCuAR16yXEzVYjez+tdhhb3KZgr/5EdQg=; b=RV
	VdOWt43tubGn8rX9YnW0wtbKwZxC4nBjUvmh4qAIXjEGvVralpDYB+PhUkqPNxFx
	l0yxRHJgRdVZgMhyMWvlqgmRyJokKHFjJr+H/YFLsPJu/M514PQHvsQczOOkONR9
	GLctuj9fau0NFtEpkvui8FTSTbsjnwvBeU6mNWNatdKA+HX9+PzZnW7PsGx312M1
	GbkScgU+sptX5sPrEYaOovhloLEUVQUAamO7Kd7YmvRQ2AXlMBtfemyiLgYASewY
	jJvNOztOiFywSnmerC9SvM8tFfK3EsRSWXwnRQfyYGhy6tibEuUh3diVecl1h3qQ
	MU00xlt3Gaip0dWUvreQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk6ee8f45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:15:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CHFf0j027618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 17:15:41 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 09:15:40 -0800
Message-ID: <384444da-0a00-4ea5-a6f3-9bf23692f3d1@quicinc.com>
Date: Fri, 12 Jan 2024 09:15:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] wifi: ath12k: fetch correct radio based on vdev
 status
Content-Language: en-US
To: Sriram R <quic_srirrama@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <20240111045045.28377-7-quic_srirrama@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240111045045.28377-7-quic_srirrama@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 92oxbGmH_gX0VYN2R-ynxIkvfpHPc3F1
X-Proofpoint-GUID: 92oxbGmH_gX0VYN2R-ynxIkvfpHPc3F1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=607 clxscore=1015 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_091542_390232_88A52A50 
X-CRM114-Status: UNSURE (   9.54  )
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

On 1/10/2024 8:50 PM, Sriram R wrote:
> For ops which passes the vif info, fetch the radio(ar)
> to be used for corresponding functions based on the
> the vdev creation status. If the vdev is not created yet,
> which could happen when the ops are called before channel
> is assigned for the vif, the data needs to be cached and this
> is done in followup changes.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



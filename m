Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DE4C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEn0V02AuhXE7r52CmjjMCc8dfhh8auUxTS0XqiCtNU=; b=DE49OGpbba+DAeOHY8IkLDjqBZ
	PH95iAgnqMKt+07OSvoOcySmhahafvXkTdBoIEpSe/VXkZr9kfSMZVNg2NnBjWvdTdswB1hyvzCAN
	urO18zmUrmsy5SZMpGyO7s7hZU7aqHGbhsqKVhBHRYbI9KD6ou5dE00T/5kNTMOJi8MKvU3SABhvH
	rYxDd3dmOxpXbDaBftGZcrPv8EaF9f+Dr3OucFYGPU1Dq1S4wEU8ATPhauzPHwz0h4k8qxSSCaHsl
	RJrfoMeTVb3VwyJ+2XLbsPiS0HBCgYdBFEFwiILiTJuvP9K9a2167Sfy+OCpqoVJ01oOjxC6lEPJP
	qcZpK7Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpv-0000000EWRY-3lea
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:52:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxps-0000000EWPT-0qS2
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:52:13 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43M870vU009346;
	Mon, 22 Apr 2024 17:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EEn0V02AuhXE7r52CmjjMCc8dfhh8auUxTS0XqiCtNU=; b=my
	sh+ody7wywdNhYfzmNuGpxf5r3EhpdZ5mMo3ejSmlhTfTgvvgUMcvnKi3FQVxkP4
	iPTR39+2PDNvFEvEoS1qbZD7Nw3CqNY0nn/taal5HTC32dpW3dhuC6ARIYoZMTLZ
	D365XWp8oCU+qj16k3lCn+kNwcgzgtazEWkwTj4WwEKZIrZW0elfI4L+DFHoGrYN
	y7833oYPaFVRd2/XfT5SnT8eIEnXaOJNX+A9AmunTcOKK/ZiXuQCHBPfOhUINDzy
	m+pBKUmr3mctjM2/fy088noonjc6jZ6PPHG7LXqj/bOKqargpCHoJu5OdkGdgOfy
	gcGF4M/9zFHvEYaxKH1Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm4qddag1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:52:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHqAWk001149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:52:10 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:52:09 -0700
Message-ID: <b87f21a8-c34b-42e9-a9e6-c7a31f2375f5@quicinc.com>
Date: Mon, 22 Apr 2024 10:52:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] wifi: ath12k: support suspend/resume
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-10-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-10-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gc3aOPEnO1s2__yG3lsOm8by43XcJGPl
X-Proofpoint-ORIG-GUID: gc3aOPEnO1s2__yG3lsOm8by43XcJGPl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105212_433043_825AD861 
X-CRM114-Status: GOOD (  17.43  )
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

On 4/11/2024 11:06 PM, Baochen Qiang wrote:
> Now that all infrastructure is in place and ath12k is fixed to handle all the
> corner cases, power down the ath12k firmware during suspend and power it back
> up during resume.
> 
> For suspend, two conditions needs to be satisfied:
> 
> 1. since MHI channel unprepare would be done in late suspend stage,
>    ath12k needs to get all QMI-dependent things done before that stage.
> 2. and because unprepare MHI channels requires a working MHI stack,
>    ath12k is not allowed to call mhi_power_down() until that finishes.
> 
> So the original suspend callback is separated into two parts: the first part
> handles all QMI-dependent things in suspend callback; while the second part
> powers down MHI in suspend_late callback. This is valid because kernel calls
> ath12k's suspend callback before calling all suspend_late callbacks, making
> the first condition satisfied. And because MHI devices are children of ath12k
> device (ab->dev), kernel guarantees that ath12k's suspend_late callback is
> called after QRTR's suspend_late callback, this satisfies the second condition.
> 
> Above analysis also applies to resume process. so the original resume
> callback is separated into two parts: the first part powers up MHI stack
> in resume_early callback, this guarantees MHI stack is working when
> QRTR tries to prepare MHI channels (kernel calls QRTR's resume_early callback
> after ath12k's resume_early callback, due to the child-father relationship);
> the second part waits for the completion of restart, which would succeed
> since MHI channels are ready for use by QMI.
> 
> Another notable change is in power down path, we tell mhi_power_down() to not
> to destroy MHI devices, making it possible for QRTR to help unprepare/prepare
> MHI channels, and finally get us rid of the potential probe-defer issue when
> resume.
> 
> Also change related code due to interface changes.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



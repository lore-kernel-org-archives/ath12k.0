Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689DCC5478C
	for <ath12k@archiver.kernel.org>; Wed, 28 Feb 2024 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/aurOMC6vn5W0P2oao4ZO0NeBu6P6yycKQG5lak+Hk=; b=Pn09T65g0+YSRHAwQQIZVeXquX
	/h8RNjMZQ/TOPeNiZf4JfZk7pG+AlJ9eAk3g+3NMFmfqd4XU4iJ754oQDi9yxB+0r6hNp42vl76Uq
	MRJbotoJd+KnZwmXJ84d3/8NbAoeOqqe5IGBgHfLmqKvPpyPesqtfTR4MDwp8yLB9Rit10KyZIYK1
	FMc1gIcTUchnb89AjYdo6UoeuVhU7lhKsPTddEdeKSgZJbymVy6+dn3VzEL0b8/3NqOQC1axM1C5x
	Sjc5LcW8gLd80xXUw1+k8X/nMdASXrUx92BXQLpowKm7h0Vg8w7ZfbZsmIg94jNZ0gvNMl8gom42P
	b41CMvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNy3-0000000AL8R-0N6I
	for ath12k@archiver.kernel.org;
	Wed, 28 Feb 2024 17:43:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfNy0-0000000AL7l-2dOO
	for ath12k@lists.infradead.org;
	Wed, 28 Feb 2024 17:43:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41SAxLIZ014965;
	Wed, 28 Feb 2024 17:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5/aurOMC6vn5W0P2oao4ZO0NeBu6P6yycKQG5lak+Hk=; b=Il
	lw3qfHtUCOgBy/rXDgAjDqJ9t3yRbGiAPrBuE5322cC/jK0N+lsOIVYw/QyDuXYd
	JpTvqZsDtscBhILN7ZqN5Qzn6jSTPXUorA/ucUwWfvrPeBWoHTqWMEy5TnAKyBST
	FVMPFh1Bbr5G1UNdORyAyc8WpdWbcCKcSJ5Ud27MaVeQulCmix/aJTjo8Tj/EbFa
	A78lEkpzctRK5o3FAm3eY2vUj3i436mdgxB1pDCHzCmlf1EK0HmQp37LhiI/lbYB
	N8FffPiM1jArH7BuYX02VM2bOu7KBUDuapNA2R6ioZqqcb3rj5ViZxXdMi/N4oG5
	ETUXH2Z+H1qYtVBzSQHQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whw3f1xea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 17:43:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SHha8I027097
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Feb 2024 17:43:36 GMT
Received: from [10.110.113.97] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 09:43:36 -0800
Message-ID: <b204df66-a6a1-4a0c-b001-be81d6f6823c@quicinc.com>
Date: Wed, 28 Feb 2024 09:43:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Performance of WCN7850
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Jun Nie <jun.nie@linaro.org>
CC: <kvalo@kernel.org>, <quic_periyasa@quicinc.com>,
        <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <6a5b62d3-d807-4fa0-91e8-fde93d114b36@quicinc.com>
 <CABymUCNYBMxzQ_BUObU+mKaDVo0uYpH8pkVn9=Rry6L+FA6TRA@mail.gmail.com>
 <c0997912-3fae-4401-91f1-ea67e43993fa@quicinc.com>
In-Reply-To: <c0997912-3fae-4401-91f1-ea67e43993fa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Bia7VdsbEVL2f3C3jNgoyYOge4cOfyOT
X-Proofpoint-GUID: Bia7VdsbEVL2f3C3jNgoyYOge4cOfyOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=798 spamscore=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 mlxscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402280140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_094340_702063_C41FD09F 
X-CRM114-Status: UNSURE (   7.13  )
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

On 2/28/2024 9:39 AM, Jeff Johnson wrote:
> On 2/28/2024 12:52 AM, Jun Nie wrote:
>> I suppose performance of 5GHz can be aligned with 6GHz, even they are worse
>> than custom datapath in Android. Is this the right expectation?
> 
> That is my expectation. I've made the development team aware of the
> discrepancy you are seeing.

Note that in theory you should be able to achieve higher throughput in 6
GHz due to the availability of 320 MHz bandwidth. But when using the
same bandwidth, the performance should be similar.




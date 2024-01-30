Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85524C46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 19:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tCQIto8QgTKfD6R2WbeoOYijRkc9qs1t2QNAo7236fI=; b=FGQC+VZ/vph7PWldyrxiM7msAQ
	N92UZVH7b6qAHs5YKoyKIKR5U+EktJc9PdBWIRAq6+hPW+psUh54cePk5lYYe3a9Xio1rgSPumgrD
	KvcLBiVsYxil+P2BzAbIQKlkmIstzjdiPUJ6owyTi8yYBIsA8+qHP9jKzCbE5maHm4MUbdCmRHeve
	gDe67CV9K/vISA0aTt06mds5nDxkRxMUgAlOHNVd/49kVr2kMXcG1lOFHksLOklvX4t7m9oSEBB1k
	/I9T5AY+FKWdmy0JuWTzF5Ei8BL/vFl2SdL0OekOc7tWIOgmoC+hC1kUTgCv5+/BuktPi4AqbvLsE
	STVc3mYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtxR-00000000Mn5-11ta
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 19:39:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUtxO-00000000Mln-0qeb
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 19:39:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40UJDEmp017907;
	Tue, 30 Jan 2024 19:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=tCQIto8QgTKfD6R2WbeoOYijRkc9qs1t2QNAo7236fI=; b=p5
	H11ov+IZr5UyhUrRSvjKguf7T7hFwsqr92FX1xIW6A7uIzzapji1JTtSDiBe5ph1
	wY512380EwMZQ2Qs0RKuY9dKklyHUdGeTVuEsnMrE9LLdkjVPaSuMb6xb1T2AikM
	06G7hk5pcE+AWhHNBBqMAPmbRjeDXAUmv75LqLQcUXPXnovso/EW9V61j4F5auvx
	1zva7zW0p5iK4Sps1kMX2McY4ZfslQ45fxNVpeFwRfh61gj96aTv1giW0t1Q0aXB
	K0QNx5jap+SxOc8fHxvHZZSzgIwECHoq4Jj34qel0BazqDvTo5tFYW0Kwf0fy4aO
	ClPdDjEL0tUomMjhnrVg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxrq0a5je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 19:39:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40UJdeFs024958
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 19:39:40 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 30 Jan
 2024 11:39:39 -0800
Message-ID: <1525e3a8-3ae8-4f64-a562-43edbd73b532@quicinc.com>
Date: Tue, 30 Jan 2024 11:39:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: Refactor the hardware state
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240130060838.3895599-1-quic_periyasa@quicinc.com>
 <20240130060838.3895599-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240130060838.3895599-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Nz48oYyrSSsgXfeyH-UY-kPDwi1xiBwt
X-Proofpoint-GUID: Nz48oYyrSSsgXfeyH-UY-kPDwi1xiBwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_09,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 mlxlogscore=455 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_113942_391541_FE517859 
X-CRM114-Status: UNSURE (   8.10  )
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

On 1/29/2024 10:08 PM, Karthikeyan Periyasamy wrote:
> Currently, in multi wiphy models, the mac80211 hardware state is maintained
> within the radio/link structure. However, in single wiphy models, the
> mac80211 hardware state is needed at the hardware abstraction layer
> (ath12k_hw). Therefore, move the hardware state from the radio/link
> structure to the hardware abstraction layer (ath12k_hw). Additionally,
> update the naming convention of the state enums to enhance clarity and
> consistency.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



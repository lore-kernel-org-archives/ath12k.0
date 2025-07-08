Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E2FC71130
	for <ath12k@archiver.kernel.org>; Tue,  8 Jul 2025 04:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpPlKRq8193mV3AfX/u5+oxTuYEiQDX3fHG8euZJBos=; b=zehNKEiFzG8xYrphkv5HenmQxy
	fW1f+JfRtPFBKwISuop1odxU2cFMuw4LbKdCp9Mg1X6CscmT68GeVDI4zheHs4cTBjIHUxzTlzOWg
	ZaOhXBxD6GoIu0ptLAm5UTpDck5fosItBzQXYMy7POBxc6DREgllkSk73Mi70Gebe+PV0SlQR0dCZ
	hwMW8Xvi7AiNqIueT0aeqHTTmauQnHQX/s+YHO60CmmNUCqtVy+yvZFYZ//h9TQDk7eTEREoVyaid
	zxoGejOPpNc2Gb6Kp8We28tgKDWR7DeGDJ4T1QBv/Pin51PS462sOmmQIMeni+GeQ62dKdNnZgUIi
	uTWZeDgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzX5-00000004DYq-1Ane;
	Tue, 08 Jul 2025 04:02:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYzX2-00000004DYT-00Dq
	for ath12k@lists.infradead.org;
	Tue, 08 Jul 2025 04:02:13 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567IN530018796;
	Tue, 8 Jul 2025 04:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bpPlKRq8193mV3AfX/u5+oxTuYEiQDX3fHG8euZJBos=; b=debLavC1IH5S1lhp
	98Ja5JReDWXDbiDMvcHhV7Q646kNzdJ2QcGWaV4FmJfMPr2oQT268e4N86rwO0Pl
	xEf0b1paNud/eqQvqyju0DvYp20oi59yhgMHYqX2VNMAxWEx8qjoq3KLbySm+DPc
	jU1CjGtoQUJiLrOrQ5HVcL/SDjQABvUK+ij50H9pUnngfa3EmNVf/B0LBbL87cR7
	ayNyrioBvOR75DpORn+lvO3FnlwBhIlGYkt3OEADtYqgGr37bjew+9x+GHA4KkXp
	23G6K16osT5mk0FOofNtBbj7z5pAYnhLomY0XAac88mNORWBcynPrf9aDL4gROJS
	Y+VK7w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu0wackx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 04:02:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56842AFe006925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Jul 2025 04:02:10 GMT
Received: from [10.216.52.3] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 21:02:08 -0700
Message-ID: <0b80a915-ea84-4537-b716-a9b2b9b90d21@quicinc.com>
Date: Tue, 8 Jul 2025 09:32:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: set RX_FLAG_SKIP_MONITOR in WBM
 error path
Content-Language: en-US
To: P Praneesh <praneesh.p@oss.qualcomm.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250605050135.1802902-1-praneesh.p@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250605050135.1802902-1-praneesh.p@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B5Q5saZOCwm_18Y-frNSgOwkwPYrmVG-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDAyOCBTYWx0ZWRfX3H3RRV1mmCVy
 UCG6RGE7Ba6GEc1gHmJFnfUWtQ+W/O0K6q9ZQL3+KvddWJiPcUPHhictvBwb996eG9h4F0qW0PZ
 eOfnT0DCxdCQ34yWobz0VMeex0FPbPaB5ekrzBoeti/h3BNBMbVt+nJh50NylQwPQyNg+R8dbFV
 o7zjknWlDQi5ndd09sB0RL3iPS8SsjywVy03AVzLnY46jmEJzPSMX2tFoIFgaV3XHOledkNw982
 LH8wGd6mBletYdsewR2/6J3tAWF6XSE0emW/oHlIBzl1ad9SBQfqE+frg42Gp+i52cNGbUtUBNR
 h30r1uDMf0bwJhTSFmUNCjc46f6xS9usEBEHb35dtC/oq7uMVfdsYOVqcxgCFyb03qlYIeZX814
 QAr7xuLI5oV6eTs19yiQ7HOa+YD7a2i/pGSjKTrKsSOpX9qEa6mMT5BRPlbxB0banbuKRzb6
X-Authority-Analysis: v=2.4 cv=Rd2QC0tv c=1 sm=1 tr=0 ts=686c9843 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=5Ws8dH_KWFtnXDiRp8IA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
X-Proofpoint-GUID: B5Q5saZOCwm_18Y-frNSgOwkwPYrmVG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=704 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_210212_068006_6BF4D3D2 
X-CRM114-Status: UNSURE (   6.94  )
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



On 6/5/2025 10:31 AM, P Praneesh wrote:
> Packets delivered to mac80211 from the WBM error path currently do not
> have the RX_FLAG_SKIP_MONITOR flag set in status->flag. As a result,
> mac80211 performs unnecessary monitor mode checks on each packet, even
> though these packets are not intended for monitor mode processing.
> In regular rx path, this flag is explicitly set to avoid such overhead.
> Align the WBM error path behavior by setting RX_FLAG_SKIP_MONITOR to
> prevent redundant per-packet checks in mac80211.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>


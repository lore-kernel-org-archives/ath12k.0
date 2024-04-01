Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDDBCD128A
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 16:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PpQJmMRKfh+QzPsk0u/o9f0HYEYPHnrdCl/XGINJWAo=; b=D13qxLdbkfMR095iZ/zYApSnLh
	bN20jrdpJEYc0YlUcVs9s6Ufk58J1F+PGFHryYnmZ+ChfG5kO1GbqEYRizZQBmKTPxGW0njNa/p22
	XJQmVkZd8GfI9+5Q6IJiHgsKFRsNo+Pp7DJfZwip7wAcnNc9Thj9wZI9UogX6uWzci48IOu/XiY4j
	SdxbjC/rYZhGj5bMUnzR3mD6TqtSgNVx4v8HFNZP/+E6ACowy9RcB3gQsUWoDB0+AnPmzuKppz1v9
	5PIvN/PGAeQqddYZwe51aWiwnGwbDGv8rbiB/goZ+vyM6aoznDcNN2FNCdrAnEbn93dBzIC8RYmSp
	ITw90nZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKwF-00000008OXy-4831
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 16:55:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrKw4-00000008OWp-0wFP
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 16:55:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431EUNEo014622;
	Mon, 1 Apr 2024 16:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=PpQJmMRKfh+QzPsk0u/o9f0HYEYPHnrdCl/XGINJWAo=; b=V8
	ycbgtEuygKT6/lp2w1gbg49PB1wP4DDyG7BTU7Z3zjOGHsK9pqGLYyIMrpcEJy3W
	F9eH+PCvFyA5bITAY1Sv+oFE9WxQhHJBwZasEYxXg3RHTQ+1LVUH9GfxMnlNXvxd
	T10W49dc8Fcvd1rSFobFM9d5OBWwYSVp0pbCp+yuMnSwXl9o/AGUo0UWwVjKD+Ri
	kZ6T+nSd2CDdpp37WsDcmHQ6cs+w11D6JdgeqVcbOJcipq+Nqg+2NUQ/i2pVi0kw
	JsZd+ZDZGYbxWEpDAV7zKmQUWtxqNR0/6oArA172g6A3pRbzlrUeGSF/O79D++K/
	CkoFOvQ/XS71THUoKC/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7nbq1fes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 16:55:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431Gt0Zh032512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 16:55:00 GMT
Received: from [10.110.126.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 09:54:59 -0700
Message-ID: <f17ab010-5874-495a-8bd8-3e18e85cc327@quicinc.com>
Date: Mon, 1 Apr 2024 09:54:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: extend the link capable flag
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240329012358.2242354-1-quic_periyasa@quicinc.com>
 <20240329012358.2242354-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240329012358.2242354-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: r0buV9fgo2rzxWOZxcPBrrILLDrkVjui
X-Proofpoint-GUID: r0buV9fgo2rzxWOZxcPBrrILLDrkVjui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_11,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 mlxlogscore=691 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_095508_332749_0B678DA3 
X-CRM114-Status: UNSURE (   8.23  )
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

On 3/28/2024 6:23 PM, Karthikeyan Periyasamy wrote:
> Link capability categorized as Single Link Operation (SLO) and Multi Link
> Operation (MLO).
> 
> 	* Intra-chip SLO/MLO refers to links present within a chip
> 	* Inter-chip SLO/MLO refers to links present across multiple chips

Is "chip" the correct term?

I'm thinking that this should be called "device" since that is the unit of
hardware that is detected by a bus probe function and which is handled by a
*device* driver.

Doesn't this make more sense if the references to chip and SoC are changed to
device?



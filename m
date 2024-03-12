Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A7C54E5D
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 21:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R6fxnjGQ25FjYpI9+FNsWUddqnO8/9u0rGlXt1Yjmls=; b=ZU+8442I9lxtCQBwjRIvo/+NO8
	kGOchvsGxS7G2bVPQfmYnuQCJcVnncxUmy7BLd0j3nZaaISnC5flM8aZ5PKlAXxawFD0ZjQm6hNnT
	QCE4kPgG27nsiaRLezhgf/+tH7mcAsCKzlsKBgrr/0rRKrK47aK76WcYJJP0S+BK5Hxdga03bq5lf
	Nd3ZufwuIsWOohhk8fRcA9676Xv9TxIimb0RlADnb62bRARmiGVcP6u7bCZfkbAWC8cJ/hht+J0Fq
	jabji2QnuRXltiG4eu4T/LPGe4+MFaCYuEGZDne38wwMPa8GSwmTHgR00XaD59HuzSKZH8tqQv9r3
	b/m6peaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkA8o-00000007hBz-1ei4
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 21:58:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkA8l-00000007hB7-3zoT
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 21:58:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42CLXi7W032245;
	Tue, 12 Mar 2024 21:58:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=R6fxnjGQ25FjYpI9+FNsWUddqnO8/9u0rGlXt1Yjmls=; b=pV
	wyKQxB/yu9TX8oiDfd08KOaINk65WnPn5vovjWcffzpxlC5yk32ciFT+H+gxqGhL
	M9jKLmLVluM3ll7mSoHvsvAwDoMOrWfK6XB6JFQ+GRVQp9XoKixeE+/7JBB4UoeV
	Qnu064eJlDgoQhT9kJwLMmDKFkdPZz0HWW6sQk5vZiLKN+WdX3OUM6cYjB0tNXjv
	6Y25P5dPWLIjj8bZOwVucwj6wZs+YV7b4dXeoLaetKnaTbxsLzLXibxQZQWkru1G
	2A9wrprWcq+d8Fxt/yQh0vWv/Oz2Y5X/ZzcZpMEId85TSh1U4C3y83piavN7prwV
	ygv0hqErbbwL4UGyhZ6Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtwpur8cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 21:58:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42CLwT28024964
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 21:58:29 GMT
Received: from [10.110.27.195] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Mar
 2024 14:58:29 -0700
Message-ID: <6615e7c0-5665-4ae8-832f-0ffaffbc6ae0@quicinc.com>
Date: Tue, 12 Mar 2024 14:58:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/12] wifi: ath12k: Modify add and remove chanctx ops
 for single wiphy support
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-3-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240312135557.1778379-3-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pi3dq2oUajzhFbIuO-CFhHiQhTk2OpxR
X-Proofpoint-ORIG-GUID: pi3dq2oUajzhFbIuO-CFhHiQhTk2OpxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_14,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=662
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403120168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_145832_141694_907E93B5 
X-CRM114-Status: UNSURE (   8.14  )
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

On 3/12/2024 6:55 AM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Modify add and remove chanctx mac80211 ops to fetch the correct
> radio(ar) based on channel context.
> 
> This change also introduces new helper function to fetch the
> radio/ar based on channel context and ieee80211_chan which internally
> uses the radio's low/high freq range.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>




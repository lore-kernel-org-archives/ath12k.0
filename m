Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991C4EEAA59
	for <ath12k@archiver.kernel.org>; Thu, 14 Sep 2023 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fyTR87WwK/GA8+o4qEnMiH0qL8sRRPxEtDmI02jYDQ=; b=gJPQUVdBsAiDls
	H8G+zzgH5J4jnFWzrhe9ps2W24Hhu3EnNSv1809AcDUy4v4UplUJ5xNM/AnoIi++V3VYRZxGhUds0
	YM0KMPmX8ZmxOPWeKSLzPxuxTxLPtE6fyQAoPlIVLKBTjyqubjNrpnoz7GQZ3rfSu0gSMKnlk0+VG
	e9idzxjIe/UR3pXGaP1BqB1m/9l3rf+/TpA2pYi2v3F9UOVTHajLBMYd0+qR0QFWa2GC3U+c4qwUf
	UEu8Q3FjFzv9hKJu1EBeg6BMylRtP2l4zFE8kJHzQoW8QO5JUxBB0z0CHCyiBasW8xmuTgDGC8WmP
	C5VjutyEb4wR3/ZxqP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpxA-008yYx-0s
	for ath12k@archiver.kernel.org;
	Thu, 14 Sep 2023 17:16:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgpx7-008yYX-0D
	for ath12k@lists.infradead.org;
	Thu, 14 Sep 2023 17:16:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EFF4oq031482;
	Thu, 14 Sep 2023 17:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=49V10djmjvx7SRJFwUw7Fed4kk3YjspXJB5VV5P5WAs=;
 b=P5VGC/sXmyBdPLQCLH13kNFpg2bNXVae6CQSjFEU2MGxl4fXIG2AM4Liahg1epB+Tsj/
 +Jej+kU4NJNEKLGkGSLIx8Rc1B1U0W8BckeAMkiC2XfycX0jGpBIxMIg0uhXXMthuMf8
 /+SRFXxTEVjpSlMwxfSjklyhUB5H1D0k8rlfQXkBektE3/SEIiIE8VnuQjc8Rwt04VsT
 YQjtK0s99JssxFvCjkmm72qAWxYMDA7l5NQ3zoFtSXfRqE6j0y0MfQhrROfMmFePyGic
 ZLHi8C0euxjqPlCwGOYjhJi7nZgXlpI8eYis1mvpaDldRpBrACU2xesWrB9WNRWaNzJV 4w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t41sr1204-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:16:25 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38EHGOVe025638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:16:24 GMT
Received: from [10.111.183.186] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 14 Sep
 2023 10:16:24 -0700
Message-ID: <584af1a0-798c-405a-a9e4-fd22ba7e2508@quicinc.com>
Date: Thu, 14 Sep 2023 10:16:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] wifi: ath12k: add configure country code for
 WCN7850
Content-Language: en-US
To: Wen Gong <quic_wgong@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <kvalo@kernel.org>
References: <20230914090746.23560-1-quic_wgong@quicinc.com>
 <20230914090746.23560-2-quic_wgong@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230914090746.23560-2-quic_wgong@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6S9BKhQJIJKZRmn4tzU4UQxWvdpClG6C
X-Proofpoint-GUID: 6S9BKhQJIJKZRmn4tzU4UQxWvdpClG6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 mlxlogscore=571
 impostorscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_101629_576476_6C525B91 
X-CRM114-Status: UNSURE (   9.17  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 9/14/2023 2:07 AM, Wen Gong wrote:
> Add handler to send WMI_SET_CURRENT_COUNTRY_CMDID to firmware which
> is used for WCN7850.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

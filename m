Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ABBC61D85
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 00:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unLh31R0600fpbOVFK+B8UAWpEPSFIy+t8J3hS1yEg8=; b=BmqQgQrrGpMY+H
	XtbfMFb4wMjLO7Itd+JgJvZEzmp90buryePZ0MEGYVTjJA8Dyks+4rm7jkr9dl8eXrwKGmjCVfv3t
	u4cBWAEyuVqs8Z1yGjWK/ZNDQjHsMihiDsNb4ozaK6VwSunbiiUOdXAmCUnnHuGUiwVFigpaBMFef
	MXfY/YkdEbSgVrytKpPMFckqrdtBgESFzObdYywNvNkT4ST/RNigzpWNEErn1pYSsQ3ccIGOFyYzu
	lHzYpPx5kXiV0UBKu5J35ig3vF5RqBa7RgcZ04OJovP55GwpXGNqIr6uB5t5buAWWIH1vlcIXaWp/
	a4lE0sEGvAvDSwJ0z8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Era-00FG3T-1a
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 00:43:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ErU-00FG2y-0h
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 00:43:34 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL0FqWt024759;
	Tue, 21 Nov 2023 00:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=yAOBm449Tl1kAubAwTsoXCsiWK1Ge7McedU2Qp8DQc4=;
 b=RlACDlzp22A0xYGEuNoXBUBZntDqo5oqZN5VAK1iM5ILT4WkLUgP7tIJspow7y21S50D
 3vg8eZVbcrycdsq3F7kbznly5m32atDcyDXtfEtbijIF/QLvtd53CziiQYvpIBPL8cC7
 MBNrzIy1xx71MGf42N/o8QrUpw8JWw/BAo7DzGK+9ohlBzf+I5QqiXc6pBVo/xXvWdHW
 xCvOhpegqEtYVX2MvBbZKECYFo78rMZ6sWXZwfXPr56A68b747wyFHYcDtj9GxepbBcn
 fq5tqPh5h+CB86tOlMw8wM3ihtLf8YKVtvlsoUTuzwltXfvQeKN0+XSJFmpeAG7t3tQ3 vw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug30mj6h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:43:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL0hUuA030361
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:43:30 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 16:43:29 -0800
Message-ID: <0ef439a7-dda3-43cd-9f5c-22be430bfe80@quicinc.com>
Date: Mon, 20 Nov 2023 16:43:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: avoid repeated hw access from ar
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231120235812.2602198-1-quic_periyasa@quicinc.com>
 <20231120235812.2602198-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231120235812.2602198-3-quic_periyasa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jIBO5DQbMEi8y7JWgGdgfv1qc5RzwPax
X-Proofpoint-ORIG-GUID: jIBO5DQbMEi8y7JWgGdgfv1qc5RzwPax
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=522 priorityscore=1501 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_164332_266139_0213EB1D 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 3:58 PM, Karthikeyan Periyasamy wrote:
> Currently, the helper functions are accessing mac80211 hw data from the
> radio (ar) structure repeatedly. So optimize these helper functions by
> storing mac80211 hw data locally and accessing it directly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

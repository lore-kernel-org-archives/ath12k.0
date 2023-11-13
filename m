Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1678C4167D
	for <ath12k@archiver.kernel.org>; Mon, 13 Nov 2023 15:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1Hh+Baffi8dP60aAJaXbDp5KMCV4zS7t/JGJCJ05bY=; b=qcYjpLJWd1V2pp
	ZuNeKwTfKqr4G+BoXMggoEe1hmKUeLYZl54kgTEdVpcXnmqQgr73btoTfe5OsH/McZKqR/uXqyLvV
	z/SB1PkyrfJ7A+r22NYgS2GaXiBIRB3bG9cEM2yE0YBgnsQb0COwC4W9lys30U1D8uoIXZD/rilWf
	VPygZMnW38RAx3zCRjkKluxRvgnk2pkWb3hHU5ZvavVps3HJWKIwM5VUYfJGd5I4pKsdjNMv1xZr2
	a+uJjsBLrNQiFlLzGxDH1iJ5jhPWu99bi1+p0koyRqHCcgHplHUwYZd230picZ4i9oywDVW6gk/8k
	AxRjxajmGGqu9xW9RsdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YmH-00EEWx-1i
	for ath12k@archiver.kernel.org;
	Mon, 13 Nov 2023 15:23:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YmF-00EEW5-30
	for ath12k@lists.infradead.org;
	Mon, 13 Nov 2023 15:23:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADEmDWY002855;
	Mon, 13 Nov 2023 15:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=F8VsjVHDwB/Ybn7oJmTWbi9p1Ym1eKbUTp8e2mXltbU=;
 b=DZhFKCjJ4eujl5gsYQVi9Kg1LBcoIcb+wZMGu8Ne/TtKfHXvmKkJHZZpxi1vbVETn6iJ
 /CUc/FgSF97M9yuCYhzTkl00jT6Ay3xvAbsl+jUcAgAex7cWQZREVbmnxFtcX8q6sXUL
 wINrZEY7IG0rfwj9OJklaTKWr1LMiKuoCQGShSzkJB7RfdeQDgQRD/FbQooDn/jbgNn9
 7I5+wtkiiNmwzJpM6E9iQEhRMTXH+jODgqTuf9iHavujFL/O0iJd2aa2qEDIRr+K6W/1
 ZqzFGGhCzSL22BEkGGMT8K7GUWvDIFcuBz8wEjCzVFNCn5sEQct1vkgVe+4VsXQp1rA+ Og== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua2wfkxxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:23:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ADFN2WO015490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:23:03 GMT
Received: from [10.110.49.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 07:23:02 -0800
Message-ID: <defbec68-d547-428a-985b-d668466126cf@quicinc.com>
Date: Mon, 13 Nov 2023 07:23:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wifi: ath12k: avoid explicit HW conversion
 argument in Rxdma replenish
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231111043934.20485-1-quic_periyasa@quicinc.com>
 <20231111043934.20485-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231111043934.20485-4-quic_periyasa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XfHADncQm9HMU3WjDgIrO3dKW1T2zM-T
X-Proofpoint-ORIG-GUID: XfHADncQm9HMU3WjDgIrO3dKW1T2zM-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_06,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 adultscore=0 mlxlogscore=253
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_072303_994948_D255593E 
X-CRM114-Status: UNSURE (   9.77  )
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

On 11/10/2023 8:39 PM, Karthikeyan Periyasamy wrote:
> Currently Rxdma replenish require HW conversion argument which is
> unnecessary argument since ath12k driver configures the Rxdma only
> in HW conversion. To optimize the rx data path per packet, avoid
> the explicit unnecessary argument and condition check in the rx
> replenish.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

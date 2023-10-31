Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9136DC4332F
	for <ath12k@archiver.kernel.org>; Tue, 31 Oct 2023 01:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uf+qtPt6zE1TiTnduExHFYHAnK4z9NCvZB+cX3Kq+Gw=; b=ZWPIDdrBpI5kOe
	THUAZe35C9Gglqi0J/XR58VNRwlFsWa7gnHYX6kx+vAGvWT7ybBq++W57EixzVehLjxmZK8KLeljz
	WU4psU5INo0mVG5AIiwmGjt2lX39FAXKxK762GDksw9x82MfYv3nDFu1XTkiZnSejbPE9Sf/4mfpl
	4EfTlf2ppLdgRezc/4JBwZEFYFb/NWuyZp58lKRkfrA2G824hhFkzHMhVwFy1e08e7CtEV5dTF1NC
	/tJOfEXOOsbBcAvpP4j6VgyM72KottqVHR/UvDPXxNtMQhyaE/+qSWukPYG4jA/262YiywJhVwxro
	6TODiJNmUwhmvM5BiIkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxdDQ-004LRM-0x
	for ath12k@archiver.kernel.org;
	Tue, 31 Oct 2023 01:06:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxdDN-004LQq-04
	for ath12k@lists.infradead.org;
	Tue, 31 Oct 2023 01:06:42 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39V0kdO3004740;
	Tue, 31 Oct 2023 01:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ZtGyXaqZXtuspAbT7cjuShvH7J+SbZZBfrnbHLgHCZw=;
 b=SMPZnGxL6IP/sBu5UvKIf+tKi+R1JNA3YWmFhK1eot5hxBfhuGar85WaBYPWYamRdIdz
 P7dg5UEgO6rMQ9eoASvqiua0pdpfRvYLY6JqOoCNx0AZkIndKlzKCr+gTq9/dQeMWbh+
 SuD2XwgOv99LXEXgxJ4Sr/TEYiw+rc1HxiCe2dl9DwG1++wz5IjuALdo23k4ylKRvlmA
 y8tVZbz38QUpxFu7mii70r+93uqNemgQB1l1zxx3OSqyd+Jk5SlVSBpRpPOhMQ7ykHtV
 LcRMDm/uTChmG7cElFrgo6a0ULDDBF7SDN7H7CULZziXo9leDr9Jujg9ev4aVQpwgfAM Rg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2fuvgyg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 01:06:39 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39V16ciD020334
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 01:06:38 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 18:06:38 -0700
Message-ID: <8df3aa3f-f03b-44b3-b71d-f4e90255e822@quicinc.com>
Date: Mon, 30 Oct 2023 18:06:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] wifi: ath12k: Read board id to support split-PHY
 QCN9274
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Ganesh Babu Jothiram
	<quic_gjothira@quicinc.com>
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
 <20231030222700.18914-14-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030222700.18914-14-quic_rajkbhag@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FPYKUMErRG3AVDARqSMKb6zgRSj6UIm_
X-Proofpoint-GUID: FPYKUMErRG3AVDARqSMKb6zgRSj6UIm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=806 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310310008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_180641_179120_7DDB20B6 
X-CRM114-Status: GOOD (  11.44  )
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

On 10/30/2023 3:27 PM, Raj Kumar Bhagat wrote:
> From: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
> 
> QCN9274 can support single-PHY or split-PHY architecture. Currently,
> only the single-PHY architecture is supported in ath12k.
> 
> The split-PHY QCN9274 requires different AMSS firmware binary
> "amss_dualmac.bin".
> 
> Hence, add support to read board id from OTP. Based on board id
> decide whether single-mac / dual-mac firmware needs to be downloaded
> to the target. Also, update HW param max_radios to support split-PHY
> in QCN9274.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ganesh Babu Jothiram <quic_gjothira@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9241CE6918F
	for <ath12k@archiver.kernel.org>; Fri, 22 Nov 2024 21:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEoADqBo8Y2ihGtHgqXwVWkc/iPbd+mNJfFXRwUM//I=; b=5B3JddR03EBkF1Pq+5O1vjL8JQ
	qQYmahTlxeFW3spdzAVjxJQEV+vD3aVORhQ8cYSoQ2HW6iylSxoeZMlw46jW8ifoxc+pSJWGRXkOu
	9f1RGBWNj/ob6hexkkoIKlCuzUUUicuraDmLADFIQegPY2UcuN1IUS8FplwUd4rpZ/2PRzQxBinCN
	dT9zledq5xsf3jDRLpsWD+mnUendxDNC5fP+2f2jz9o3J09AzYcFfmsEP8faL8P5az2II09MXP+Uf
	dtXVFuDdFmZeKiwOvTMwOgyEj/3TSBh3O+JF5FszUvh3sP2QKAR8yahQixEyn4CruIrQVLenkl9AH
	MNqwKMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEanQ-00000003JZg-0zou
	for ath12k@archiver.kernel.org;
	Fri, 22 Nov 2024 21:02:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEanN-00000003JZC-3wiY
	for ath12k@lists.infradead.org;
	Fri, 22 Nov 2024 21:02:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMD5Xg2020741;
	Fri, 22 Nov 2024 21:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eEoADqBo8Y2ihGtHgqXwVWkc/iPbd+mNJfFXRwUM//I=; b=fJDOVmmuYi2Qybus
	DhhIuD1Duky7mqGIHI9xr9anq0lTMfQLgtnJQ3i7AFl+uN35jFL3imUJ4Q46qqc+
	Y96P9CfBAnJx3E+BVuaIbo3+b6/VPnKoe0ICsrGHzbaKfrRmAEty5beo2CUt4kCn
	yJRc1YrE3Z6bgrrB8yi66TREPBGcTIfwfTE8XOiQVoZddJHgyITOGT9OAWXHdQqv
	i1HCbyoJf8gAkVfjIQPAiRcbLBFZVSn9sFFvPVy9s771b9XJcTfzQHnz+LUGGH0H
	RWEooNqTI3qtee/+rNmL2OW/Ur3Yxlzc2bXiosvi5R8XQaZC/ZxsXywhznHaCsqN
	YbxYVA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432thph35q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 21:02:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AML2QVQ028222
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 21:02:26 GMT
Received: from [10.111.176.168] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 22 Nov
 2024 13:02:26 -0800
Message-ID: <f5573d77-ed6c-4b23-b58f-da0fc5f22f9d@quicinc.com>
Date: Fri, 22 Nov 2024 13:02:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Report proper tx completion status to
 mac80211
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vinith Kumar R
	<quic_vinithku@quicinc.com>
References: <20241122173432.2064858-1-quic_tamizhr@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241122173432.2064858-1-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _3nj9n3HZlrXFMDpbymNmhoaQYD-4TiN
X-Proofpoint-ORIG-GUID: _3nj9n3HZlrXFMDpbymNmhoaQYD-4TiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411220177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_130230_003917_BDE109E7 
X-CRM114-Status: UNSURE (   8.72  )
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

On 11/22/2024 9:34 AM, Tamizh Chelvam Raja wrote:
> From: Vinith Kumar R <quic_vinithku@quicinc.com>
> 
> Currently Tx completion for few exception packets are received from
> firmware and the tx status updated to mac80211. The tx status values of
> HAL_WBM_REL_HTT_TX_COMP_STATUS_DROP and HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL
> are considered as tx failure and reported as tx failure to mac80211.
> But these failure status is due to internal firmware tx drop and these
> packets were not tried to transmit in the air.
> In case of mesh this invalid tx status report might trigger mpath broken
> issue due to increase in mpath fail average.
> So do not report these tx status as tx failure instead free the skb
> by calling ieee80211_free_txskb(), and that will be accounted as dropped
> frame.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Vinith Kumar R <quic_vinithku@quicinc.com>
> Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



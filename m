Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E316EC25B74
	for <ath12k@archiver.kernel.org>; Fri, 24 May 2024 16:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H2CMLcz4w0LrB0+lpDZ994mnA5ZLqOXlT9kIlNKna0=; b=X4eBw8JN4HTfsinGsMZ+N37MyZ
	LQX6hojb5xpDCnkxtLu/yesFEh60ItVpIqiEHtz/K8Gvnxdp1fTOgyWergolX3AO1YDrH1ycd9men
	5q8ZNLyJuyCuD4OQqYnuPx7zj35z/Ra8pIyzMXvU9bu5B8nk6AJL2COZ9qe6rdayNwIGnyxDCND5b
	q6ZdS8pfI7aOUQxdoupaYzij5J9barNRMojQdnPl1PjfBs4hjjHJY/L0n36sL2+ORvnrPHGuKDtJd
	Ba9WpsYK5JRakyKDKIOTo4JkUJnKP11h6aaSn1FxJAO0Jlb5ECyDPPWDnZGOgKstfSViIFVlBjf66
	s39lvPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAXlo-00000009NLO-2Gtq
	for ath12k@archiver.kernel.org;
	Fri, 24 May 2024 16:27:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAXlm-00000009NKh-1EYH
	for ath12k@lists.infradead.org;
	Fri, 24 May 2024 16:27:51 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9Ck12012370;
	Fri, 24 May 2024 16:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7H2CMLcz4w0LrB0+lpDZ994mnA5ZLqOXlT9kIlNKna0=; b=M/cFfa7yUClaoJC6
	y1Gh8HJn+aDFmNDyo2vXSrnie+Yisud725lwXarfjg7b4sYSplF0LbcC6AFK5DKB
	6JFdsrroNmzitc1dpcBXM35Bbdo5LROM4iF4P2qS3y4syUdY1jC08Pw9QnpOd6lE
	SN3dTD3lPlY6iZPQOpPIprPn3xftmEMVbhjsrSGXi8KhCzED5IyBNqR/hiNBUWAt
	2goagYaY/vvyQY+/powLjxB7Et3166u6CM4tZdvvmiVQN1UHJ0j4vRMvUsFic2dm
	g8/Gq5Rv0vQLmLhc+UG9dzbgEy8rwf4RIZsmonEa2pzg9xhclXYIOxx6HQRM+UV9
	+kRE2w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8htyxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 16:27:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44OGRlER012634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 16:27:47 GMT
Received: from [10.110.127.239] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 May
 2024 09:27:46 -0700
Message-ID: <1a29a21d-fb3f-4b0b-a720-6f005608990c@quicinc.com>
Date: Fri, 24 May 2024 09:27:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix wrong definition of CE ring's base
 address
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240524024021.37711-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240524024021.37711-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jg7xt9BT4fife6WFyYRDBX7xgQ5avdJ8
X-Proofpoint-GUID: jg7xt9BT4fife6WFyYRDBX7xgQ5avdJ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 mlxlogscore=879 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_092750_370219_317F9E1A 
X-CRM114-Status: UNSURE (   9.37  )
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

On 5/23/2024 7:40 PM, Baochen Qiang wrote:
> Base address of CE ring is defined as u32, currently this works
> because DMA mask configured as 32 bit:
> 
> 	#define ATH12K_PCI_DMA_MASK	32
> 
> However this mask could be changed once firmware bugs are fixed
> to fully support 36 bit DMA addressing. So to protect against any
> future changes to the DMA mask, change the type of the fields that
> are dependent upon it.
> 
> This is found during code review. Compile tested only.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



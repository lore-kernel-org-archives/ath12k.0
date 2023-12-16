Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31831C41535
	for <ath12k@archiver.kernel.org>; Sat, 16 Dec 2023 19:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+kJebN0ucY9l9lmuBZVwmwZwshXbmYLuSDRi0krzMo=; b=yx5L5UbnMGLgE65DnXeF9fzUOi
	Fyw4/Q3Lgc+lCzH6PhdMY7rryWQaKSxdSBRo5PjeeIjrg283+eEG/vmN1P8j85wx4FmEYcNW4syfE
	Jc+h6cbkBBJNh1jRggnxS1V07zqhXuhegsx8eiqNDrrhcRBZTABvQ/RnWrkiE5ogIJ8sKYhTtMjsC
	NcpO9+843/SSLiWM4r7FfcjWEy7bvEGOK0E19peFFJGCejOT3w7eq6QVkRpms6qgX581q1w5F9kbo
	6UMu5E7P8S8uGVX/IGkrD3qO1kk4gMYfBLnzPsE6Pk7ptb/SqIU7ve2+WhZarXRw567dC4Jy/fUBJ
	viycorHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaCh-006bo1-30
	for ath12k@archiver.kernel.org;
	Sat, 16 Dec 2023 19:20:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEaCf-006bnN-0A
	for ath12k@lists.infradead.org;
	Sat, 16 Dec 2023 19:20:02 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BGJG4xG004233;
	Sat, 16 Dec 2023 19:20:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=b+kJebN0ucY9l9lmuBZVwmwZwshXbmYLuSDRi0krzMo=; b=G7
	xAx6KFjAqsp8ebdNQS7iXfk7HZPLkGnWd+ycBByZgsKqZH4+tx9GG03BOK4qosol
	nQcFk8uDVfEaR4jgHECxuAe9xuPuU/lBUuG1ZzDrDwwRk58iCAqNf28cSyurCxqg
	T0wMcDppqnfG0wmDlzKKcd4HTTQatB8ULSUaZa9fntZM0BQs+FauGdNkUdncykYH
	pcDeBa0W6YWLyJMSw4RAg5aK+L2CCJNyrujwC5FUco+DaUEXStsdC3BbEKuJ0jDG
	/hRRHZhgGAhki2TtS7RBLGXUfIVegfI1iQ99nQ3DqEWICnmBynovAXSFeGs/0Vmn
	QdyLHOJubMC97BF8kq4A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v156dh1va-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 19:20:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BGJJxqE021631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 19:19:59 GMT
Received: from [10.110.36.237] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sat, 16 Dec
 2023 11:19:59 -0800
Message-ID: <31f4014b-75d2-45da-b0eb-11820df07c54@quicinc.com>
Date: Sat, 16 Dec 2023 11:19:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] wifi: ath12k: remove unused ATH12K_BD_IE_BOARD_EXT
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231216060140.30611-1-quic_bqiang@quicinc.com>
 <20231216060140.30611-4-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231216060140.30611-4-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XKtwmX2hdNVEnbRiTEumArcgPOTXR4w5
X-Proofpoint-GUID: XKtwmX2hdNVEnbRiTEumArcgPOTXR4w5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 malwarescore=0
 mlxlogscore=692 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312160148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231216_112001_091449_0F3295E9 
X-CRM114-Status: UNSURE (   5.60  )
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

On 12/15/2023 10:01 PM, Baochen Qiang wrote:
> From: Wen Gong <quic_wgong@quicinc.com>
> 
> Currently ATH12K_BD_IE_BOARD_EXT is not used, so remove it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



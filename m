Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46479C67861
	for <ath12k@archiver.kernel.org>; Fri,  5 Apr 2024 20:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBsMMbcryFsQhLVqNfUH95wz0PWvf7S85kA93QV9pC4=; b=wnVebAm1SstuynXXsH73oTCA3J
	TIUfPAmf7uQ08Tl8bf6hkUkwP6WO9Umij/1pf691UKU05ifBBqCq1shjoRHMbaxShA2iBeUTcaS7D
	tOctuVYl+ilNTMaHyeHfm7CRxdp8O+ABlYw7X8lh4r84k+Gc9LdeLbxXr9gVsL8y/+2ajtBpKocvG
	3dYVJCszUajCnqlNhfbqsqmuhJmp8EsqZTg66jHw5WXJR7DVdidkAqUcnkuakGC644kfNagTVDvWs
	eOeNyilejzc/uZkgDSyk0+873Ml0JlPthDQBzBXCS19bk2Gxv9Uu1MivYcz5NezMRWWpOzBm690Em
	AXtSFf9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rspvx-00000008kCm-3mrT
	for ath12k@archiver.kernel.org;
	Fri, 05 Apr 2024 20:13:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rspvu-00000008kCS-3h4o
	for ath12k@lists.infradead.org;
	Fri, 05 Apr 2024 20:13:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435F7rJD012548;
	Fri, 5 Apr 2024 20:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YBsMMbcryFsQhLVqNfUH95wz0PWvf7S85kA93QV9pC4=; b=L6
	jr0VXh45YOWLbSr9tmYBmHXdTcz8AeJedHO7tC6LfyPpWVC9bDAmYx0bCQJo0lVz
	R03SwNlsOjyf3Jn8EVqJE8zThfnjxZ9jWDvx9LBr1PZbFexgHuAlOo3pHbW/tbTE
	rhVAj+F5NG5EFwRRxJmtJF0bvMVnH61ztPM4xShEXzPLFe4B1GmM0YcOacP+ChoM
	QXFLO3+6jN3XvpxrlHXIs2+IZwASvGsL4mAFazhUo2XQQaxJYClMrfJTA1m24Iz6
	IRRe1KeSzwBqUhQ+PCzV9J+PE6bJOxVg7D0r+l9hqKerZWP6CMzeod4C1B8koNPR
	4ZwyniDzpavCBUnffH+Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xa8fc25n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 20:13:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435KD4UP012396
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 20:13:04 GMT
Received: from [10.110.127.230] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 5 Apr 2024
 13:13:03 -0700
Message-ID: <f65dd27c-39fd-4a6f-82f0-ee621bca80c1@quicinc.com>
Date: Fri, 5 Apr 2024 13:13:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/12] wifi: ath12k: Cache vdev configs before vdev
 create
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240405194519.1337906-1-quic_ramess@quicinc.com>
 <20240405194519.1337906-8-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240405194519.1337906-8-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _ODo3HHmWWl4lN_45TeEHrZ961wEr3s3
X-Proofpoint-ORIG-GUID: _ODo3HHmWWl4lN_45TeEHrZ961wEr3s3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_23,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=670 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404050143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_131307_180776_3ED3A8D9 
X-CRM114-Status: UNSURE (   7.79  )
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

On 4/5/2024 12:45 PM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> Since the vdev create for a corresponding vif is deferred
> until a channel is assigned, cache the information which
> are received through mac80211 ops between add_interface()
> and assign_vif_chanctx() and set them once the vdev is
> created on one of the ath12k radios as the channel gets
> assigned via assign_vif_chanctx().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6BAC25B74
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 17:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foQoLOjode6ixdX2vTm5wPQocoQksHX5Tnl0SzoC/Qg=; b=sARNkIMRzVPg72l3UY5OboOMCs
	mzmtmGwA6lsIuIb2acwQi+qiGSgK6DQtJlqVCfycx9EJyw4ELF4WjqlyOY71K922w5ItMrfh4yl/T
	UbniA1rmywh7hjd2uLaFM5G81MsC6cSW/yZUBStQExmYqZ+8UzcYOmpbzswEUJ+jnNb972SIFF2/Z
	maoiVK0pE/g/8HB69fCZb/fjxFkoy6KpSbNBo8FGrMBAfriHCRCQxpoBPFhy9XoFeaPcWez7Wm8x6
	JImNqWrz53xEk7y/F0mNlKo9iN5e0E3s+FiD4h4wXAlWvkh+Jc3y+88MiI3egsxIIKu7lOxG1fTcC
	FX5bSDbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5UE8-000000062Dp-2Yxj
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 17:40:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5UE4-000000062Cw-2qd5
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 17:40:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44ADVIRX004542;
	Fri, 10 May 2024 17:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=foQoLOjode6ixdX2vTm5wPQocoQksHX5Tnl0SzoC/Qg=; b=RA
	9uHoTdj4FtbGmph4sMgwLb8R7wDrAUrBQqYSdP+BzymDIhsVl7IfCcwqWh0ju4n7
	5idJHiNhzktryfGlETNrJoRL/qvQp+YoFzjE4i9mr0lsJPpgcYmGLJqmFGJZPqUq
	Cy+xEwGsZ5xIa96d1XHFiAqh8Rs96LyBQfzgFdHemkuOsxvD6E5r959xZ/PuCV+1
	A5x8Yq0obhL8DLYtUgR8BcX3YNJJRieS1/EV9BQymgHB+AzI5EX5sdtA5PgOA25I
	v8mTHAQsykuVu85x56hdlzTbdo4eF6ZbGm1iimvh+G2x0Luny/fQmjEgeym1Thwv
	k6s0hqC9WiTtY9O+S0aQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16yt22rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 17:40:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AHe6Lc018081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 17:40:06 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 10:40:05 -0700
Message-ID: <ca92e2d9-a64f-4d6d-a25f-8085a579f41a@quicinc.com>
Date: Fri, 10 May 2024 10:40:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] wifi: ath12k: support GTK rekey offload
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240510064748.369452-1-quic_bqiang@quicinc.com>
 <20240510064748.369452-7-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240510064748.369452-7-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QcXMlBQaMwaVKU6N8EzuBia3SWAUKBkS
X-Proofpoint-GUID: QcXMlBQaMwaVKU6N8EzuBia3SWAUKBkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 mlxlogscore=665 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_104008_877056_216E8FD7 
X-CRM114-Status: UNSURE (   5.39  )
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

On 5/9/2024 11:47 PM, Baochen Qiang wrote:
> Host sets GTK related info to firmware before WoW is enabled, and
> gets rekey replay_count and then disables GTK rekey when WoW quits.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



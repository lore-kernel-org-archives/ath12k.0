Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD0DC02182
	for <ath12k@archiver.kernel.org>; Tue, 21 Jan 2025 04:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLZ66EA0oEnYbbajR85OhvcVgHaE3xcQ3t0bbCkABPw=; b=0xo/G6DYrN98J3NLjnGkO9ZqLV
	sZbRGZfla6j++33550cbM3NEgRBxpYBlt8kigPMVy7Gkd/l4kEfL8jFbvX+XIpqTgAFnWxyP7CgUo
	LmhXDbYoT6F/P689AQLCLpa2X/7BrXQjyTcrchTslIkS0adWyK18HHIc0Jnbr0JSQ2Tw+6qgXNLpR
	mvgVtDZD5gwfE+z+jDzu/vhvcyb5STNEP7A9YzPTbZkDMgj/tCk9VsF4I7GrQ/C+Qyl87KZeJmI+6
	T3JoNuusJTW1vMoVadnVVximsWYkOcAJaIoMMD1IhcgQhFHMfuccWUY4qTfbI9ifp3JpApcpsJrNw
	j+xdNCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta63l-00000006seW-0sDf
	for ath12k@archiver.kernel.org;
	Tue, 21 Jan 2025 04:40:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta63i-00000006seA-1yP0
	for ath12k@lists.infradead.org;
	Tue, 21 Jan 2025 04:40:15 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KNGsVE014241;
	Tue, 21 Jan 2025 04:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLZ66EA0oEnYbbajR85OhvcVgHaE3xcQ3t0bbCkABPw=; b=XRIjjuFNZwfF8ig4
	a+HnoPMHkPzGkyW+/9SInnpIj7zYvJnLaoc5SvXqblpowlDkw7/LiCETiQFlN148
	ff6GkdYHvC5lxT10tEc5M6EFizWG7986mR5RKEA4zH2AemvxyklVgXyFM4/qfZh+
	iUrOol8Boa/G4bfGMZJexIzp9O+/Octg2ANM00pGlXy22I6qbr+14C16479xXv13
	KDlkqBhCQwOxncOPCe00OMLIzPSGNQjfgtTGS8+UYCeQeaKin7Ss86Luzkn+aSg3
	mazKbceOhBSqUZRHEXe3ENavHQl4tsw9Rss6oZiBOYZkW+oqWUj0zk04wCr8Gqqf
	z8wTNA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449xxcgk9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 04:40:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L4eBoW021583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 04:40:11 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 Jan
 2025 20:40:09 -0800
Message-ID: <b38164bf-3ea3-41d4-8387-330623257ad8@quicinc.com>
Date: Tue, 21 Jan 2025 10:10:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath12k: Add WMI control path stats infra
To: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <rajat.soni@oss.qualcomm.com>
References: <20250120184447.658660-1-ramya.gnanasekar@oss.qualcomm.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250120184447.658660-1-ramya.gnanasekar@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: W4p38yunCZkTZwmfCqte6pnyVepkPfTO
X-Proofpoint-GUID: W4p38yunCZkTZwmfCqte6pnyVepkPfTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_02,2025-01-20_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=735 mlxscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_204014_520331_E2CB3125 
X-CRM114-Status: UNSURE (   8.95  )
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

On 1/21/25 00:14, Ramya Gnanasekar wrote:
> @@ -559,6 +559,13 @@ struct ath12k_debug {
>   	struct dentry *debugfs_pdev;
>   	struct dentry *debugfs_pdev_symlink;
>   	struct ath12k_dbg_htt_stats htt_stats;
> +	struct ath12k_wmi_ctrl_path_stats_list wmi_ctrl_path_stats;
> +	enum wmi_tlv_tag wmi_ctrl_path_stats_tagid;
> +	struct completion wmi_ctrl_path_stats_rcvd;
> +	u8 wmi_ctrl_path_stats_reqid;
> +	/* To protect wmi_list manipulation */
> +	spinlock_t  wmi_ctrl_path_stats_lock;

nit: extra space between type and name

@@ -92,6 +243,11 @@ void ath12k_debugfs_register(struct ath12k *ar)
>   	}
>   
>   	ath12k_debugfs_htt_stats_register(ar);
> +
> +	if (test_bit(WMI_TLV_SERVICE_CTRL_PATH_STATS_REQUEST,
> +		     ar->ab->wmi_ab.svc_map))
> +		ath12k_debugfs_wmi_ctrl_stats_register(ar);
> +
>   }

drivers/net/wireless/ath/ath12k/debugfs.c:251: Blank lines aren't necessary before a close brace '}'

-- 
Aditya


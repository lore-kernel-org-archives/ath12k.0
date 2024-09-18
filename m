Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81DDCAC5B5
	for <ath12k@archiver.kernel.org>; Wed, 18 Sep 2024 03:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ji+S/8uP1cN9CTE92uVBGjy7oW7DWsdrd2yCNoOMh8c=; b=Im6i7a3tm5W3+SDdcyCe7vy9gG
	p2mDOhZUOo4AXnqcoNx5DPBbvmY0HgqxQxkD+cI12tn3lcxpHu+x1YoB8+mwpPvGQRuqqrg3+pFP/
	MtieoolYd0YSj3gEkBfBmayILix+K5tL5XohiOfhGj8NTHn6kPkSe8x1sJcok75DnnSucaW5ZxVgc
	/gPAu2jhpdiO6f1s26WC9xkdofSnLGeBT5XT1/ie2xDV4560csUQFgWtmmHaFblSkk6TTqPkpAu0b
	EJjOtBEzrp/hfCyjU48mt2dZKyt5bO/jDzLS/XvxHUD2XUih9Z0hgZo6pP07hcpjSYZxSLNnV9g7v
	0uPbqnEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sql1Q-00000007MOh-225t
	for ath12k@archiver.kernel.org;
	Wed, 18 Sep 2024 03:06:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sql1N-00000007MOI-1CuM
	for ath12k@lists.infradead.org;
	Wed, 18 Sep 2024 03:06:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48HHk45S022323;
	Wed, 18 Sep 2024 03:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ji+S/8uP1cN9CTE92uVBGjy7oW7DWsdrd2yCNoOMh8c=; b=JMHZyn18gma0wICA
	/lZuuMmndravjAGOjqeNnj3Cft4Y9HdAwRVJ/ol7qVeIK+kPs6T0yaOBhilIySvs
	aXcUOVK1kgPfgUv4Jwzr2YxLv272NbOTUbpTQPVpN14VESzASwTKaduLJi1bwEhN
	icEEgJWFgGCZInGvOQ52kGr/LdHVL+fnlkrhDALlHvmi86mh+He5xZR/RXOZR+2E
	ToI1Ro4d8lWLvewQ0gLXhTUbZSQaBQxghpsLHN1+gSH6FxtzxvmP+p/4S5qe9XCN
	S83JTzp2EpQR07C42IwlAPjTGDijzIfLHduXsijfpij88TtXItBzora2WEUYbXqp
	R1thZQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gd0jqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 03:06:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48I36Ltq015028
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 03:06:21 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 17 Sep
 2024 20:06:19 -0700
Message-ID: <2e42483d-39b2-4042-b2b2-4c6be8e5ca60@quicinc.com>
Date: Wed, 18 Sep 2024 11:06:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k firmware regression with update 82318c966fd1
To: Takashi Iwai <tiwai@suse.de>, Kalle Valo <kvalo@qca.qualcomm.com>,
        <maxwang@qti.qualcomm.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <87bk0nc1yb.wl-tiwai@suse.de>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87bk0nc1yb.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JAo1wBWUTnY6TC2IilUT__dvxGJ5W8oL
X-Proofpoint-GUID: JAo1wBWUTnY6TC2IilUT__dvxGJ5W8oL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 clxscore=1011 spamscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=849 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409180017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_200625_374470_267EADE0 
X-CRM114-Status: GOOD (  12.53  )
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



On 9/16/2024 6:44 PM, Takashi Iwai wrote:
> Hi,
> 
> it seems that the recent update of ath12k WCN7850 board-2.bin update
> broke WiFi on Lenovo Thinkpad 14 Gen 5 AMD.  Reverting to the older
> firmware seems fixing the issue.
> 
> The report for openSUSE Tumbleweed is found at
>   https://bugzilla.suse.com/show_bug.cgi?id=1230596
> and for Arch
>   https://bbs.archlinux.org/viewtopic.php?id=299286
> 
> Let me know if it's already handled in Qualcomm and the fix is
> expected shortly.  Otherwise I'll try to revert the change locally for
> TW as a temporary solution.
> 
This is a known issue and has been root caused. 

+Max to be aware of.

Kalle, will also Cc you in the internal thread.


> 
> thanks,
> 
> Takashi
> 


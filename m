Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B69C27C40
	for <ath12k@archiver.kernel.org>; Wed, 23 Aug 2023 19:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mek12EnrYedJr8U9EhkNxWKtU9BygjRIJBENOBhLUE=; b=ujtAzZ1g9kwm+m
	xsZNgfYpYqUYATVc20bJ9bg0DbHVxE+xgV5k7y+khv6cLCqNCQOgIq47rHoVDk8CH/X3bfLB56aor
	jrOD7SnYqhQwY7MVEUsbewCXKZXNaH5o1iVXGxBKWWf7NIuqGHX9nbsaU+hBi/q0tVV47FJqUR0Tl
	RZ+PP9bk6ipy3qqC60VOs2AN1sa+7lK5gFBhtSV3Qb6BVbZ7KFiw1xLGebBdIicumn+zxgHkKbQVl
	bkkCR9Sq+1lbOYxgfBJDooVnS0nSBCslhIzZicyhgHNwX12iUuABo4dPk2BeLYLe7bpxV2jcvPqi4
	AxBx1mKf5ECko6pQ1RHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtXE-001Pj5-2G
	for ath12k@archiver.kernel.org;
	Wed, 23 Aug 2023 19:28:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYtXC-001PiX-0G
	for ath12k@lists.infradead.org;
	Wed, 23 Aug 2023 19:28:55 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37NHu0uM031525;
	Wed, 23 Aug 2023 19:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=nWkX+BUg99eXcykkBankFCkg8ZVaQEgKD6CtJCFVD44=;
 b=Id4HPBFb1+0qXNnpa+LE9+e9nj+fkLBshuSdSQGsAX4zpmO2wq+9Jog6vjCh4RB/Eyh1
 7qM2F62B7ZL1Wi0MrlNtq6SkwCwheSr4aMsQzf82RZvHPMkS01b0+K/pAI7II5vvM1de
 rEqcf0z3fxi4/OnsAFnxzTl5kwx6R1Pt1V39+LK29bNP4CUE8mraM5xBtDd9e+BxvMGo
 qsP/pfQ0Qg8OA2bkWKYh4Qfl53MA5O6VRNqS/grSdJm79zIqlHm3oVQLApWzmjuF2fic
 S5WP1D18ASfwrRVphgjX9897/DK3QBgLGcwZYTnpfGz2U2J8lUEVO4Ow2yA8xkmTZ3t2 Iw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sn208k2b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 19:28:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37NJSmaX017649
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 19:28:48 GMT
Received: from [10.48.244.52] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 23 Aug
 2023 12:28:47 -0700
Message-ID: <e5a64ac0-7f4b-40c3-8f63-d96cae2568e9@quicinc.com>
Date: Wed, 23 Aug 2023 12:28:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] wifi: ath12k: add msdu_end structure for WCN7850
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230815062610.59248-1-quic_kangyang@quicinc.com>
 <18b72ba8-7f0c-ed88-38f7-7422a179519f@quicinc.com>
 <87jztlhboj.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87jztlhboj.fsf@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HRuNPNaqQRHpRflOOI5ovZ8ZDv5-OmZd
X-Proofpoint-ORIG-GUID: HRuNPNaqQRHpRflOOI5ovZ8ZDv5-OmZd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-23_13,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 impostorscore=0 mlxlogscore=394 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308230176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_122854_161876_2CD40F81 
X-CRM114-Status: GOOD (  11.16  )
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

On 8/23/2023 11:10 AM, Kalle Valo wrote:
> Jeff, for some reason your mail didn't have Cc linux-wireless so
> patchwork don't show your comments:
> 
> https://patchwork.kernel.org/project/linux-wireless/patch/20230815062610.59248-1-quic_kangyang@quicinc.com/
> 
> The problem is that if there are no comments in patchwork I will most
> likely miss them. Adding linux-wireless back now.
> 

Thanks for the reminder to make sure I always select Reply-All vs Reply-list

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k

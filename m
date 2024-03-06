Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D662CC5475B
	for <ath12k@archiver.kernel.org>; Wed,  6 Mar 2024 19:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:CC:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o+eIkwUBoOUL5XxSpZll8Hu2LirTZ7upNAmW82lLjA4=; b=TwrQ14Z73up1Rl3u4enqe0dkq/
	6+3zGM3hmygncBLkZlxAdoEm1hHb+WC+1kXPwK7HY4mgbOA1dmxlAjA9CV5AKPYNUh5xK3n+oYBAA
	eji+Aw4SQKugf3uYh460VN1FhVtEbJ1aSWY020RjW6kaeUBo3zG5y6LooWvAvA3nTkE2zxtfmPGeZ
	Ro77zi6I6ekm+MkKmBGCnuWeVz7vA7uGE/HQ1UaV3ffs5kyfViYXgL3wETbAdW7EaEBgsko5Oc90p
	7tvbQO8hQ2VYwAXI7fb+A6s3rA3BLAfLJRoheCfCZQe1hi4URDdc4pnrbqihUP5rxgIuF4/C0JMWB
	YXSL8KCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhwrD-00000001cDo-1wrP
	for ath12k@archiver.kernel.org;
	Wed, 06 Mar 2024 19:23:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhwr7-00000001cCM-3HXT;
	Wed, 06 Mar 2024 19:23:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 426INnfw014934;
	Wed, 6 Mar 2024 19:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:to:from:subject:cc:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=o+eIkwUBoOUL5XxSpZll
	8Hu2LirTZ7upNAmW82lLjA4=; b=gCC1WdVx/33vEcr+GS4n08A4poRa4qyGbLxw
	gSPiYDQbCstkQg2yWo4qg5zKW4FPq/BahYm5EombSiSdO5/T+hWXDMwUBjFwkFMP
	k4ERmwOe46rUyXbgSF/k5QvPxD57b4Tn/+BKnVZmDAPvc76hUT+rwSgYn45tIRjS
	5w2QvnivJRRma46usK/WkoOiFwVjArW83NSyfv92nIgpJesYmmlTweySL1+EQLq/
	LHPqxK/3hIPnxoZMgow743xW/1OC+ivU3Uz5N/MFBgGhC5PQEWqaWNipUx2l+QOf
	G5wDQ5wAjYfK0IOX++CkNShpySP+W5mYidpPAARdozqwCr5KLg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wpnfvhceh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Mar 2024 19:23:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 426JN8XI025386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Mar 2024 19:23:08 GMT
Received: from [10.110.86.150] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Mar
 2024 11:23:07 -0800
Message-ID: <bac97f31-4a70-4c4c-8179-4ede0b32f869@quicinc.com>
Date: Wed, 6 Mar 2024 11:23:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ath10k <ath10k@lists.infradead.org>, ath11k <ath11k@lists.infradead.org>,
        ath12k <ath12k@lists.infradead.org>,
        linux-wireless
	<linux-wireless@vger.kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: New staging repos for ath1*k firmware
CC: Kalle Valo <quic_kvalo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -p5vyI_FfmWX5a8b-GYt3kGdeJoIb33U
X-Proofpoint-GUID: -p5vyI_FfmWX5a8b-GYt3kGdeJoIb33U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_12,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 adultscore=0 mlxlogscore=982 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_112309_869384_90B0D957 
X-CRM114-Status: UNSURE (   9.81  )
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

Historically, prior to being incorporated into the linux-firmware
project, firmware for kernel.org ath1*k drivers has been first published
to Kalle's GitHub:
https://github.com/kvalo/ath10k-firmware
https://github.com/kvalo/ath11k-firmware
(ath12k firmware was pushed to the ath11k-firmware repo on a temporary
basis in anticipation of this move)

But in order to have repos with multiple maintainers, as well as to have
a hosting platform with more control, we have moved to CodeLinaro:
https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware
https://git.codelinaro.org/clo/ath-firmware/ath11k-firmware
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware

Note that most people should not care about this -- normally you should
use the firmware that is in the official linux-firmware repo:
https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/

You should only need to access the staging repos if you need a previous
version to work around an issue, or if you are testing new firmware that
is supposed to fix a problem that you've reported.

Please let Kalle & I know if you have any issues with these new repos!

/jeff


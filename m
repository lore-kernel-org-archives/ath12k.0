Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB084D0D7A7
	for <ath12k@archiver.kernel.org>; Fri, 11 Oct 2024 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2C9ZVjGeGuo1wcMeYk37kBBOFT3TAusl1UrGYBdQz0=; b=jNWDAlgCsG5NcEH3QLZK6saAyo
	RSDuPkqPWms1d43QjaGQh5fCjC3i0kpKHJ53/dFeinuzU/1eV3D+afrV8t6RXn8dIJlcHs4mdXuu6
	qCmCGZBNrqBrN+5coinbHHtdsl9U+UaPfzfDDDwn10kx7kX/NTnoOh6oQfGrMFJc6OM0E9tDJtaYJ
	KJl1v1k0S59aDUo8GY+yY97ocZSCFwXk2TeC1hGembgGMcxWPYUsktB8HQMsZqYyfjlOcs1kDnnKZ
	yvK9adD+ykTAPHotWEt2vmlLPC+h/Kmg3o0Uqz1XusWTS1raXK0AmZk39tsLXhn7MEgJ1Ldm6wiuU
	kuVWsneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGsz-0000000GfRR-2ozo
	for ath12k@archiver.kernel.org;
	Fri, 11 Oct 2024 14:44:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGno-0000000GdSg-3Q7R
	for ath12k@lists.infradead.org;
	Fri, 11 Oct 2024 14:39:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BAjWOs005432;
	Fri, 11 Oct 2024 14:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L2C9ZVjGeGuo1wcMeYk37kBBOFT3TAusl1UrGYBdQz0=; b=IvqfDn7F1TvDjqac
	UMU9Zfu813+safIgFm7JWDRZTZZ2ScXJ0SxUnjZzHHR/3MuqG/+Ze2nxaNPM5sp5
	2caYAR+P1i0tATItCmIeJZ55cf8SHNop89KuEkpmUD9GtTmqh2/EE8+hz3Yk+49e
	B42inOHc1mN6X1lgkJ9AEC3YYejwER40wECObv2E54b66vqySUj3PiBKp8O2t+UU
	ps54acpTuJbdNJD23py416Kbaw86JHPizb+AOWoNoV5PN1HAmvQ0Bw6APymeT5jU
	uDWzpOy+AVNaRNBHRh5n9crfSFQGT+r2DMdkqgpORJv+buRZ9GanfsrEA4/1tX+j
	B6HKIA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426t7st244-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:39:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BEdY82016049
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:39:34 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 07:39:34 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241007165932.78081-1-kvalo@kernel.org>
References: <20241007165932.78081-1-kvalo@kernel.org>
Subject: Re: [PATCH v4 0/6] wifi: ath12k: switch to using wiphy_lock()
Message-ID: <172865757395.243911.9922704649615659085.b4-ty@quicinc.com>
Date: Fri, 11 Oct 2024 07:39:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2ENUQEBAIK0YNnf2L3THv0Jb-KR4iswN
X-Proofpoint-ORIG-GUID: 2ENUQEBAIK0YNnf2L3THv0Jb-KR4iswN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=643 malwarescore=0 phishscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_073936_926319_52E53049 
X-CRM114-Status: UNSURE (   8.36  )
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


On Mon, 07 Oct 2024 19:59:26 +0300, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> Convert all uses of struct ath12k::conf_mutex to use struct wiphy::mtx, which
> is already used by mac80211, and remove conf_mutex from ath12k. This way we
> have one mutex less in ath12k and simpler locking design.
> 
> v4:
> 
> [...]

Applied, thanks!

[1/6] wifi: ath12k: fix atomic calls in ath12k_mac_op_set_bitrate_mask()
      commit: 8fac3266c68a8e647240b8ac8d0b82f1821edf85
[2/6] wifi: ath12k: convert struct ath12k_sta::update_wk to use struct wiphy_work
      commit: 58550cdda961dedad8ed08c5abf8367d5c020fb6
[3/6] wifi: ath12k: switch to using wiphy_lock() and remove ar->conf_mutex
      commit: b8c67509b91ec23fcacbb99d40c960ab479e1299
[4/6] wifi: ath12k: cleanup unneeded labels
      commit: 31489439e6481cd0c21c8c7096d2ec44dc56b6a6
[5/6] wifi: ath12k: ath12k_mac_set_key(): remove exit label
      commit: 37d06d71e69c16d24ccc276cb86489fd2fcd00c4
[6/6] wifi: ath12k: ath12k_mac_op_sta_state(): clean up update_wk cancellation
      commit: e805272f8c2dee280e2fa1c1a454517df17f1261

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>



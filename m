Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC55FCC07C
	for <ath12k@archiver.kernel.org>; Fri,  6 Mar 2026 21:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GcTdIxIpJDK9NTAz8XntgZ8/jzN3x4gZvAopkBgHn4=; b=or9UAxX5b16vNlBgyL4fHrfTzd
	qFHz/MLwHRBnuwm7QBtIdxluyr8UtPfWHj0J+TR/25ohht2hG7qGgkhERAnpOnlOs6Da9KABls4D/
	LCVTkdE9wyQxuPm0qu/iyTBABP4xsaVANQjVX0sUlZDtK2Ae60dkulAARL7WYTBWqAZJb6aD9VZZF
	VYr07dLMVSL2PjOg6Zyk7yj+h3KiZ+ExFZ+NwYtpAkBGN7UOxl1fbM+WF9WTC7J/yj9EgZ8VJF3IV
	KNNo976NS/RhlfaXF62AbU1W3/h6OJM9f/zz9woQM2FBwWlOBvfYnu8SpnEqOgrREaX+h0zmx3Iu2
	n2CdGRJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycZZ-00000004WCk-2APG;
	Fri, 06 Mar 2026 21:19:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycZW-00000004WBo-3JKv
	for ath12k@lists.infradead.org;
	Fri, 06 Mar 2026 21:19:00 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626KWdCP2624388
	for <ath12k@lists.infradead.org>; Fri, 6 Mar 2026 21:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2GcTdIxIpJDK9NTAz8XntgZ8/jzN3x4gZvAopkBgHn4=; b=N50iH4yX6NCIPjmf
	QysHhXJPLtFDxXmwL0OM8QBXyn7ACGiUC/1V0cDfwDNEW4jFVuCxey6FaPJZH+Zo
	9W3sfpy+QFJKmHSrjW51vbLZT59stEU8pIODZ2seniFm/f3LTHfyZBj0/W+yby9o
	vEKuGEDmKkY+OwgcHd/aaYCXYGBpu7uuwHaRC5imFIur+O3NArHRRWATlUyBiFPW
	pYndcou9PzQWA5hUve36LOhejyHoY/SEpNCRmfEOGJ+T6ZUQrm1RTAxcGPw+Nagn
	Md8KcfAVnelU4ivM9OaubTRXxyOYCdTJQ5EIz2nCCoUKpc275L23Yse+zAeWilsR
	dG4nNw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv9aj7ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 21:18:57 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be232ef3d3so6022617eec.1
        for <ath12k@lists.infradead.org>; Fri, 06 Mar 2026 13:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772831936; x=1773436736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GcTdIxIpJDK9NTAz8XntgZ8/jzN3x4gZvAopkBgHn4=;
        b=jZXFgHIvj3Ri9ylmOgjiAHKygmojb1kAmD1iHDipx2poxs4PyhkkBvJZZYphdAkqfH
         2LNoo83TDPKy1WAkubCX5yTYDqUP1jf8TB+fPuy9YqZPTCTsvDSfCcHbScLVEE0jyRNC
         eKLEGErRGkaXxajgG/R+egXDeklquw2h/o6Kc0zvXMN/C6YIjx3dyRtnfR13nb0OYJOa
         q4AO4kQBVAE9SDz3ktGWSHH0KoMhoIo8/XlHDuyCcFrbLn0X2vHWoV2bJZaZgDeM/mgb
         8ojAcHYym33ZJNF90tmhtiHLXWGgqR0gWhM92AEeOVVFJyc5XpNIpAj3Fv1seIfUKYyT
         HfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772831936; x=1773436736;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2GcTdIxIpJDK9NTAz8XntgZ8/jzN3x4gZvAopkBgHn4=;
        b=EWrqsAF4PqYLZRSHV22LlTa6Vdshq+QgfDAukWmpJbnZ/vJQy4ff3AjUjqrOW4aLXm
         BT+VzHkK+GxVwEwZDZxjO6UbFX29g1xjMb3Fj4SLlIa9WNera6IdZtu5w0pSgxah1ezm
         Ro9BP1ll9aTXmrqm20GRlgi6VUpIWTetXSzBvbYLX57RxC8Sfe8tEzSqurKom/HcSfrh
         bbbZ+BFKWY34jt2CTCHeybGh1jECwFcBFW0MqjP2pK/gc95H6cUw3nWmhxbHz75rxorN
         4Qs3lwv08ICFw5xN9aBTDGQZuyR4IRk4sZ3FOxNCF4vC/VUsJWFNo52Ntwb0xnIbpRmG
         f+0A==
X-Gm-Message-State: AOJu0YxINjop+TocyQda/qb3OjnJHfBeV4ohO5+fqBOkNRbZbVytVyvB
	/4ftgP0ZQo9wAXYiJ5ZsiwuloPmY7j8dES4ZCzQNbuSfok0E8dKvUw1fcp4GA+nUAYJMxT1mzQ+
	cvJ6z6huZ4FhLqa6j7jy5X4difyJ8zKE89Tju3Nf0bRoYddUqHpSevUunU7y8HIhHWM060i/a
X-Gm-Gg: ATEYQzx+d8dTTgdgi65BpjjYUGEFIGmBLJdyPKROW4FBhNhiDgD1Xze7csToQeAu1Jc
	UjE22Tg+GqqrtH8edenw30/Ho2ht9Z7lJ47Mz+CUZF7hMo+QAmbCI5+Ddf+nn2oMRYkUyIinPEE
	JzvMf4VMtZ62AeDTimP38Y1BAclXYmcedq0TZLOfzP8FCwVupzHN9w1kpKVhc89JzjfUFDdnAYB
	EszDpeMjSzoq7lnzy6It2Xfu9J9+pE96haepIPU+7FavV/ctmgbSZ+atB+Ex5sMM4I7poqen8jH
	db+V8/IzjehALiF8g3/VkXwGoYIjMU/UUWpDVAqwnGHgeB5s0mTZHmqZSHc3ab4cPU5bA6br6E7
	l1xEcXgpIxFYTAksisyx/muzynqJunE1AAeXSpAVvPyOQHTM05Y7Icj1AmiX2GBoOCJfJrBTjEj
	Da
X-Received: by 2002:a05:7300:818c:b0:2be:22b0:8be7 with SMTP id 5a478bee46e88-2be4e08b14emr1610773eec.35.1772831935971;
        Fri, 06 Mar 2026 13:18:55 -0800 (PST)
X-Received: by 2002:a05:7300:818c:b0:2be:22b0:8be7 with SMTP id 5a478bee46e88-2be4e08b14emr1610763eec.35.1772831935421;
        Fri, 06 Mar 2026 13:18:55 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948324sm2325124eec.17.2026.03.06.13.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 13:18:54 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Sarika Sharma <sarika.sharma@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260226051947.1379716-1-sarika.sharma@oss.qualcomm.com>
References: <20260226051947.1379716-1-sarika.sharma@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: account TX stats only when
 ACK/BA status is present
Message-Id: <177283193475.1373939.16510537269470657650.b4-ty@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:18:54 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: QR8Hj0GCviXSnlK0_iF-l0HXMmiP338h
X-Proofpoint-ORIG-GUID: QR8Hj0GCviXSnlK0_iF-l0HXMmiP338h
X-Authority-Analysis: v=2.4 cv=G4wR0tk5 c=1 sm=1 tr=0 ts=69ab44c1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=oadX85OKd24toRC9XggA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE5OSBTYWx0ZWRfXwy7EzlcYn94l
 0Q5rOW55Smp00RFJe1z8hEpV7JF4v9+XJ39BGz8xuOf+72D4vkmsVTcMxkr2syVSVy+aDFUD+53
 gn6KNUWVKkAkk5Sqw4zRtoYkzWPpfnnnmSaxM6VULKpDcSLSA0EtU8IcBEjh2x3or/ToRyOgrxw
 ZALAbN9WZP+9UUf/7ksx331SNaoDHIsweGXPoOIDEKsNHJAObcECVCNkNLf+VA0S6M6zfAIThgf
 B1YT6UziYCMchy3cSYhkyvshwjoUGs59bfhA6tXgoGDwWA3+FFv6EFZx2LPOKSa9o9OLhSfqelU
 Ri0OyogJ7yHpPIlDwg/1wVHKxRDWUSC//z9f2GJ1jPC0NL1aqc1Mvn5lcvzHTbgI/F34Pj8fLlw
 NuZM1TwB4fHxqsmfNvST97KWYeo44ns80iRVcLiBkk8o9Ro0Lll+RbATxf3U31MNmKRSEkDP1fV
 wmOiaOUR3m4SVlDpaHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_131858_991416_9FE87AC4 
X-CRM114-Status: UNSURE (   9.19  )
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


On Thu, 26 Feb 2026 10:49:47 +0530, Sarika Sharma wrote:
> The fields tx_retry_failed, tx_retry_count, and tx_duration are
> currently updated outside the HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS
> flag check. In certain scenarios, firmware delivers multiple PPDU
> statistics for the same PPDU, first without BA/ACK information, and
> later with BA/ACK status once it becomes available. As the same PPDU
> is processed again, these counters are updated a second time,
> resulting in duplicate TX statistics.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: account TX stats only when ACK/BA status is present
      commit: 1635ecc61a24597f893d057d004051a535c1c643

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>



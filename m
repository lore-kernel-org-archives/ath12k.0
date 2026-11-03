Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673D1606A329
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cMYPamca;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FIY+/nW0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTZlvDDm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HHaDUp2MGnelhZyHzPnyFdDqOtUzyTDwNm6fx39HN6U=; b=cMYPamcaBiymWl
	WjYvSdBYopjXoNWiCMA/R1afZYUSfvZ+THQ6W62KZe93ANfoKY8twmyFiHd7YNvnS+jCr5gF0fljP
	F5cLRj2lY4p5HlZOtNldGm4T73oNClt2T6/5zClzv3Pp39gf/tst8e/1BrrWLHrC4bQ+0LmxslM3z
	FNOgUJcJ0lkrEKByE4k87TzMK0xNyWcbQgsgmoyUHk0mqLy50XWnsxV0xaAprWdxIk/4lJv3wtENO
	Zqi1NwJPUco92aR+h30s4gvNX7t1jaD/WEfPKCc9cHJupfWYStlq1JS55rBbJ4kleo/3UJ77FXnlh
	nrRaRIF+p3WT4oBzE/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGP1-00000002xOW-2YE0;
	Tue, 03 Nov 2026 15:26:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGOy-00000002xNU-43zu
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 15:26:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9umK3081004
	for <ath12k@lists.infradead.org>; Tue, 3 Nov 2026 15:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HHaDUp2MGnelhZyHzPnyFdDqOtUzyTDwNm6fx39HN6U=; b=FIY+/nW0lCcuvrzA
	m03A73JpY1YmWuRLtp+tN92WoSzcbXWPSDb07it3Xz7VJmrxTCrowQQe/uD1N6kC
	Q6FCQpueEmpTcxSoyPJezDoJweGSenYlY7uVdf29SXi1lVJC71F+MgzfLZZH0rnA
	qt1n4knR9KJqvChyuoeolQylL0jlJPvW8JNKdw2nFpS9q/A1jSTfO25vyC3ux7bV
	1HcTYH3PGkBXCEDcWe/2hTvN+KHRKmb/6zV3QHXgWEak5apjh2Iobbmx/oSTjmVJ
	s12G8eTwemp4vFH9o5H7d4Nv0bOEwYAcZ1AYnlmtMgDRU5+2rDR+mMfOVm6nXnis
	hEIPAg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq2acku1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 15:26:19 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso4979306eec.0
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 07:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793719579; x=1794324379; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HHaDUp2MGnelhZyHzPnyFdDqOtUzyTDwNm6fx39HN6U=;
        b=iTZlvDDm6RFuBTd6JmqMR6CW5wwVvgDw8p5JhKimoBRRDEDF+uoIa/fN9DWtxI14BL
         kEagNYc43/5FxJ76gUISWQAtc5vES8DrHz8CWYT0Pr1+qnS9fFp5yszrxWvi3I95hLGJ
         Av93Foh3dm1wbhiARJ7BpdiyTlTukLSOqM5A1gjkn+Gcc9RUxYrshpbes9+f6s0t44DC
         RF8bgT0nECeKgvR9KBvwDeRvn4XFaVk/zQG5muNSIr7H7mHqhnGP6zMv20PKdCiD589p
         YpZjDaW49nSc5B1Wivm7LZnl9y+Icw/heHc0XHuobBaUGUyCdyLSCLyeyqAHGzuHfTTQ
         XLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719579; x=1794324379;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HHaDUp2MGnelhZyHzPnyFdDqOtUzyTDwNm6fx39HN6U=;
        b=EgxwKkxVt4xnr0Mow6jpctB0ReuTPiu0UOqsORDWOKygZR2XUyi4xtTBbGqaF6cv+J
         NvsnyIP84BqkrzoHg4HOTiOx8Y61pI5EihNPaa6k/8ZkQFZx5x79dY6fvnHMv/cHhQD6
         awRTw6yb74vWnG0soY89xlKFmhDTyEWHzFqxK/ytFcyzLMA1X9JLs+lf5xFId0J5HlZe
         1sDlMXvYBiFuG2+KyfADVVSr6c7Ijf5idfVcCibWZTnlYASlNw/pNLWCwmig3DkyzX/P
         Hp4joITZNwzkBBVgZ9g7oV3B7qqHPdckduangoVOe71gg96E+eh7gBci47TaRQhiiE8v
         N6IA==
X-Forwarded-Encrypted: i=1; AKwUvBxLT0hj7PVnGCbtwzQHkS5yOoNE+G+2WbWuSPJooo/4pytFmMuNjbJ1Pk7o5GMoXCvl/BdlYys=@lists.infradead.org
X-Gm-Message-State: APuU4Z9ErGbV89phpooHyVaE6vNFsETTWw72kPI//LYwYMMSMRud3OVW
	C0f7dyGy7cUsBQB2cnKFXwtPUhUdv8fxnxJC3wMWDKmChl9Mf3fOfFpGV6q5QApNwUZy3NgyCrJ
	P4xhK/ibSQbbrnPcPuz09kRMwqwMC6YxG1OTGxyPuzP8zu2gSuby4B1sWGXhYXS7T
X-Gm-Gg: AYBFou1/NJNtOdy4IwS8qQxFU0+iXW4rVGMdEMKRVYwZCb8AUU1sFVGcjmpOX691hWs
	DAQrON14nPLC8c6shpPSe599jLc6UDjWfQD3yfMdchkvAeRo1QeK2TqD9kINMxmPg4UkWmNmiXT
	QWZdJm9gP925XcJIy3xUgqIUgkk55eU648/djvMY0b/bFlF8lgbt1jUOuCwNOSOREXUUcG6F2aP
	krIJ2TbkzD8CtawfdgCVbYOqcz0et0aUbPqi/Q+0MMRfGzNJZFAVgCi/qqW6IE74Rz0bw9OsZWs
	aU5mLqNxLcaJmO8ZWzr9N0Tx0IwxnJZ2EFw+MyJMreb5VexzpzWIDLmm7AY0n8a1K14CgH6qrhi
	8KGqULG+s+2HTxzowqYvY09eJhZT2CnNkpEoJYNNgSGdfwvw+v4advUErKn9PnOZpQIMeeH/pdF
	/SJT/ryyYYcE4JZG4QLzQJd06JGKufJwE=
X-Received: by 2002:a05:701b:4283:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1ac5cb186d7mr20218911c88.28.1793719577104;
        Tue, 03 Nov 2026 07:26:17 -0800 (PST)
X-Received: by 2002:a05:701b:4283:10b0:191:a5b2:ef4a with SMTP id a92af1059eb24-1ac5cb186d7mr20218862c88.28.1793719576388;
        Tue, 03 Nov 2026 07:26:16 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm42151011c88.19.2026.11.03.07.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 07:26:13 -0800 (PST)
Message-ID: <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 07:26:11 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T4gZ3PKQ c=1 sm=1 tr=0 ts=6ae9fd1b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=2Kb41bJ7ohxLfoScjiAA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfX8BZyg6iPklxm
 UUSjJ+IxRDQWTJiNG9vDW2a+ENXIrApUHutawut7MPV/5bvygbFLTNkdm383WM2DUFtBYB/HPUI
 Ysapi42smPmfYEmgzrado7ejQDIaRX7WWGsDlLX1Ym+YJs1Epmnhi7lTDT1b6wDiojNlrTS0EHL
 Xj/DDVLc70M/Yk6fWwNUiSxO9SqonCr5QcyF0WYYGR2mSmeizdY7xRRJZNA5MJm2qLctLZPvFQx
 AXq6l+Qa46Q9PwQGr3T5o1AYCH76Ll8wXQ3m5Foh/QkjKHFaxWhFwNo+5FbW6g9iAnuTsDCMlEL
 /gSkTX+xw+YZHoRHYvVQqJbB4wDj2GFIKKXjdKcEWVv8DXq3Oyg1to9u9Di1W6NNpzkcqVqlDmR
 ECe8LP0n5wVg5AXC28SNIJ14OwuSA8/8bC5yxN6QOnOf1V0Mbsb+SYHhE61MqUNmQh07dlRXr7e
 Rv4b1NFV2LOSihHOqOQ==
X-Proofpoint-GUID: uay5nXD-zB-PRnyKDcaQyr2PKvnKtYGA
X-Proofpoint-ORIG-GUID: uay5nXD-zB-PRnyKDcaQyr2PKvnKtYGA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MSBTYWx0ZWRfXzkhcdwsZrn6K
 dShICyMimqK50XYEUMZVchNITOhmRhXfA/1+v5qfKWkU+hDxOjEYeVRm4zzshy6i3+syUfNAisH
 l3AzujCqJ/Fkl4YWkqzluRu2C0ZQe40=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_072621_129085_DF644523 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/2/2026 9:20 PM, Baochen Qiang wrote:
> 
> Hmm, forget to reset revision number ...
> 
> Jeff, let me know if I need to resend it with number fixed.

No, this is fine. Waiting for a R-B from the infrastructure team.

/jeff


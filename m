Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5627E7717F
	for <ath12k@archiver.kernel.org>; Tue, 10 Dec 2024 04:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LuuYdInP7eOBnrgKXv1aGjEPQhcydVxdMGklxB39e1A=; b=CZ/6i9T5l5lT7CHnFJf3zMb2wC
	htM04PM4Xp3wYUISb+MarzHSwZqzDQR1PYDzpT1V912iqckaLKwtUJXLEpEiwKdWfsItmstM83NTe
	4KAnsjVSto3TnbEU7Dhf2HxmbY+C5QCjw1kCro4Z4k9wDEyJvExjO/4R6G2h+jmoB+OBR98Odj84p
	NsKXEvgpjTSumz4xNpHzfOXBbTJ3G79xlXZrBMERXJN2wwG1gQJte0VY3DAaYau73wf4HbVezuzzo
	UFo5CWMX++LdlK+TfgGYQ1eVqmiUbI24WlhwAn7MiNIpzSijVqUcmJm04f3nZpkptU4IxQHTOiAE1
	70huDeQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsCP-0000000ADoL-1wRQ
	for ath12k@archiver.kernel.org;
	Tue, 10 Dec 2024 04:50:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKsCM-0000000ADnr-441c
	for ath12k@lists.infradead.org;
	Tue, 10 Dec 2024 04:50:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA3WO5a020687
	for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 04:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LuuYdInP7eOBnrgKXv1aGjEPQhcydVxdMGklxB39e1A=; b=oAMMHS813WBACQMy
	t8JxGAc02X/1I3bzorg1ZOCwyZ85Om2gKLX0v+GSHj0827OaEdMJqSXW+DYFQ3pX
	frwPS/PrkmodWU8vN0fajgPyMv94rT6VSL3nyclWubk2xdljhqHGDXcjaN47dP2+
	BA+O3lZRScqyRD7khMDQU3dc57gY9DeTR+YLwRVBfhNcbAjJA01QT/KObMkmYjnc
	Db6n0NU9IS4TjgCJCnmJlV+Mv0wy4Y6JvWQiQRe4mnlZ0K+SxSbT/WiO0MJ4lM83
	T6Kwy3xFXWjtYd6K+eiGtv0d+YZWfMJvs3W3cDQHKq1MXodKW+Fk15CV8V5gjx7q
	p9MxIA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43e3419uc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Dec 2024 04:50:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-7fd3c241975so2058685a12.0
        for <ath12k@lists.infradead.org>; Mon, 09 Dec 2024 20:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733806213; x=1734411013;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LuuYdInP7eOBnrgKXv1aGjEPQhcydVxdMGklxB39e1A=;
        b=fyEKGrKvxj4KpQE9+Ae5lkqvW9hJHDv05ejse6jJ5VvB1+dz9W9WuUop2Ui0b3VnSf
         N0x1Kq0Zmj2z4n9MhBfZ4ZlDQd4x6C7K/wLDfEw5eIm1nGsyaxPFyBjhi7a6BEsztiHJ
         LvixFuUL9IIFsJjjYZ6gM8yqsq8fbH8pUfJ/1rk2tV+A490L6pSV+zVpjO0hhwxLB2vi
         w3jcmsdeXmHIUenZut+6aOxziMbtdRtcr0GHA0wmGQWkC7s4KZE75KkiXZm5k87pzu/b
         bXvUHdSETZnlWGOk/sM1HaSuPiu0E/A63kIO6OsRVYRhiu211oDzn87qemG4k8hBKzPa
         ZlkA==
X-Forwarded-Encrypted: i=1; AJvYcCVoS8X+ai3jbctWPeMnSyE7O1tVQe7S1tZdJtN1BG18R3VL0VwkJRb0mFFglC971bplE0RubOU=@lists.infradead.org
X-Gm-Message-State: AOJu0YydBBIFNCX6U2sUrA+PXzQ8ERauUkYm+Ai3MAuRdo713XSe7qAv
	PcusHRxZl9YL6GkLib/OCNI2EOMwvrNn28iCKbSu1hUgFGWPqlFEioqXIxQRXwosAinKS9kMuiy
	FltzbGLC82UNUe/8gigCsex132R0qqMPqH1tPrflBNrWCAkcuJqcPJqiJWI5O
X-Gm-Gg: ASbGncsK7YndJ4z4iJ4cjQ5IWLoC36i6+lgFQkhWdfDk36UkWQY1DZhtyNMrnBChdu5
	PkjumgbaqzvslKNDr9exMP7P2XYXjrZE5u6RLe1hmuerg4ao+yuyqiJyybVfE6r9D61KSyP5rM+
	oA+RSqqoGWu6SxjfHe3+UYmIgeVtEMroTK434L9LbXjUzqSiMeolcNMUewm9aDRtle3G0oRsLOx
	bTPuBbB1cW60ibOoK1MQ8e/k+mHvLvvMPe7MqYNj91yYFpYB5P+2nRE61WKnW1a4ers+uLQlbRH
	7MYbDOSoWoQl3KresepwahQ8J4vbC/i216+WTSHNySiDB38=
X-Received: by 2002:a17:903:187:b0:215:a808:61cf with SMTP id d9443c01a7336-21670a47b3dmr31989655ad.25.1733806212981;
        Mon, 09 Dec 2024 20:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGhqg062ZytpVvK9uJNkfbL9AyKTZQ/TVFVk+nH7o+NW5xk7sDSvSmjMhjypV34iXLF6KiKQ==
X-Received: by 2002:a17:903:187:b0:215:a808:61cf with SMTP id d9443c01a7336-21670a47b3dmr31989415ad.25.1733806212634;
        Mon, 09 Dec 2024 20:50:12 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2164eadc389sm26268125ad.31.2024.12.09.20.50.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 20:50:12 -0800 (PST)
Message-ID: <b5399f79-18bc-4fc2-a1b1-d010505cc0b8@oss.qualcomm.com>
Date: Mon, 9 Dec 2024 20:50:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 wireless-next] wifi: ath12k: Fix out-of-bounds read in
 ath12k_mac_vdev_create
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: kvalo@kernel.org, ath12k@lists.infradead.org, jjohnson@kernel.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241207071306.325641-1-dheeraj.linuxdev@gmail.com>
 <cd5ef876-d849-4d7b-b8b7-94377e8720f0@oss.qualcomm.com>
 <Z1fBOUqYGB5hNP1e@HOME-PC>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <Z1fBOUqYGB5hNP1e@HOME-PC>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BOv1MPl7OXPieYEbzC34FX3s7rObrQr9
X-Proofpoint-ORIG-GUID: BOv1MPl7OXPieYEbzC34FX3s7rObrQr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=756 clxscore=1015 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412100033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_205015_022940_8F4B02AC 
X-CRM114-Status: GOOD (  10.15  )
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

On 12/9/2024 8:19 PM, Dheeraj Reddy Jonnalagadda wrote:
> Thank you for the feedback once again. The Coverity issue is from the
> "linux-next weekly scan" project and you would have to be subscribed to it. 
> The link to that project is here:
> https://scan.coverity.com/projects/linux-next-weekly-scan?tab=overview

Thanks, I found that project earlier today and joined.

So now I can track both linux and linux-next-weekly-scan.

/jeff



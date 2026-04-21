Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB1CF327A8
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGJ2RvR2ic2jFvaQD6XapJ2qXWBqPIWAYII89I3SOlM=; b=AzHYI02SMdE2Q++80c2WTJaLpH
	jEhIOUtofVvn+tnK944nLtI1oT4t5YtKSs8rJtyB6QbPwBOoAttNUmMIbvzskE55tzWd3Gpe5ECJn
	K+ZhvG36/2CA9FFw1n0dWoSt2Z1y9ynWqG85PUDZsE7IQkP0AcVtt5ju57rvOvvVpoZwkLRIYziJW
	aRA7ZPFRZc1I5xTKN+UiyfBzUnEnAFo58IJY81NLKuul6K8xvpU4uirZtA6C5oaeScbWb07iXy3c7
	aRhUkeWven+KkRMGaFhMef0eI9fffjO9fWYpNhCcaD8okdl4ynEuTHVN2E8qyP8QXhQEJfam+1Sld
	vt1LkhSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4Oz-000000085Qg-3mQe;
	Tue, 21 Apr 2026 06:16:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4Ou-000000085PI-0F6J
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 06:16:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KMgsEA1127100
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 06:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGJ2RvR2ic2jFvaQD6XapJ2qXWBqPIWAYII89I3SOlM=; b=i7YYCybptWcmD9ov
	6OndIP7X1HMOhAMIg7z7va/x2jiQUGIcbl+ubR7aYOVvR1FV7vUNH9JX/ACS4ISs
	E8TJTIF4ZcfR0DeNZZ5QLlgoQfdYNvIDDZW8KCFMbduH0WXC9MQB1HkAutwC3iI/
	MnjB6SyFmOtK4t1WGA3VEwPUiUszXwXV1q1HsCYI/AZY+UNH7b2C7DYrUJf0BgTa
	fThsudG9d+70JeVvGA5EnzUAroCNtB5FERaEs2Q+M+ijp5OZDC5rj70NyON5LwAu
	rQsreEYoLesIE/qSi7Nx47uCAZ9QQ5wrOi/DcSUYElC/QZkavtCFUElStxZqnChe
	o59ZOQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68s7yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 06:15:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2adef9d486bso35464845ad.2
        for <ath12k@lists.infradead.org>; Mon, 20 Apr 2026 23:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776752157; x=1777356957; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fGJ2RvR2ic2jFvaQD6XapJ2qXWBqPIWAYII89I3SOlM=;
        b=KdHVbLf9gjU/wqfCpcLy3pGaAjH1fFNrISF2vLhXMSa2hVAPD91MYrzpoUBDzTNZXO
         3Bx5dFOC2mq6lL+pAXWluFd/hfI6HSLJAciBixl/xtSOLnKoq0u/Y3XqPSjV47zNP1sv
         C1j4w6JZGB5csZugkZtrFZmh8BZevAvy1OsS0+0+0RWBnrNHHmLQ2AwQwvmELKdEs78k
         zggTZjnBGP+v+TUu0jHYjygj+7kQGq+9pcuuRpJ7Ysoe2k8DkNnbk0GWDitAu8Jr47Sh
         hwFK/5SlMoIXNzoXwXvteLO6F5IRsnSGW3XXRX4/UPJ1B2oxTK9Y4AOMp+uKB2bsc15c
         lhDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776752157; x=1777356957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGJ2RvR2ic2jFvaQD6XapJ2qXWBqPIWAYII89I3SOlM=;
        b=WF0gCX+XsT8iillvtc6oOYGiV3V44Pe7SB1zM90sGEkeqCOJGmsr8QBMRbgjtB4Nmm
         REbwW2pQHFhYjDTejYqdQDCDpo84HNAPI8Nx+iSNeXxmO7BnOJFkcphTx2qMc4ZDbUJA
         aphAs9u/mru8oz9yqNPreuOIu0wv4LjfZYEb/18B4K2vvUeZ/oyYYkZwK/NvSC/X3vU6
         2LPDofsi5gn6vTmwWCz/yfWDc5Gz270gT8LSxEIFTLwMwKPv/mTpdmzCT3SqoIBbvq1B
         2aO6oJ0tUwcLfPbU/DzdbB04Cfl1lY7P5+kqANJe3QA/E4Ew9J33SNEX6GK2FNRRHGCP
         rCSQ==
X-Forwarded-Encrypted: i=1; AFNElJ/v+HfuifQqPkccyWVVKD1EmXH013nVqm4I/Ey5QU87Ra0aBskK3Mz256/Se2YdRwTWsBK4GQ0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1yIsJP191l9KyJx76uyINn/1oR2G/uWlCaOCu/gv+Ag8SPgW3
	YZikp+0XV8eCG4eCPrHU9H8YXq9RvsdoORQk7RQzXATK9FMkWX7o5+VakWKc0eJBtjk9UIfzap4
	ZaEeyHB4cTOFpaAYk1SeKtggR5Hf0Svy067ZbJfsv1bJnI84OcfGeDf+mFGYNFHUn
X-Gm-Gg: AeBDiev8ql1NR9Wh6dzuLo82nRiElW1yceaDMeqR51jMfssuzPYXEaXJWUhzdX8Daz9
	kdv0I+4olk09xiQBoglLNxwt+LdbytBgfs52WKyZ6EoMicJs3vvAAO+osQwO+VQLhSWJEDJYsV7
	EZQ0Nscugm1ObI3NyzlSTUFJEcjPkYTSV1YinO/NJ2J9L1HPgszVJBvJp2nAtNinNo2IGiddmtV
	GMyFnaUh3e+0XSfbve9rstDi5aLiUQpf8GqjzDeYM5Bjs9s4XKwSUlGD44aCWlhZpqe0/Z+evRA
	/0hArFwhQeFoGXk05udrnHBt0qm/n6ZZxvwX+oDlqkZljfcZ3eN4d8AngZXMZtg4Mji+QgF637i
	6y1pXN4TAIZXpRJFUAgEFlrMoBqKrWP3Rfok0CvtM3L9eStJQQVAdiHpHsVzveePef5XGOgRB
X-Received: by 2002:a17:903:1a83:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2b5f9f36f53mr169205405ad.20.1776752157513;
        Mon, 20 Apr 2026 23:15:57 -0700 (PDT)
X-Received: by 2002:a17:903:1a83:b0:2b0:61c2:8e83 with SMTP id d9443c01a7336-2b5f9f36f53mr169205275ad.20.1776752157053;
        Mon, 20 Apr 2026 23:15:57 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm121268505ad.9.2026.04.20.23.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2026 23:15:56 -0700 (PDT)
Message-ID: <752f38a0-738b-4e89-8e12-b38f8d207af3@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 11:45:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add channel 177 to the 5 GHz
 channel list
To: Yingying Tang <yintang@qti.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yingying.tang@oss.qualcomm.com
References: <20260415063857.2462256-1-yintang@qti.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260415063857.2462256-1-yintang@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3-akOo8RE40yzetV7h04ma3-hH9Yc0PF
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e7161e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=dGk-cjk1AREVnTvJvk0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDA1OCBTYWx0ZWRfX12NOPj9wwPCL
 XCZ/U9BXSNnZRRMESfUvQ5EPxKsIEL0LiIl+MhA86pzopX+UXkjuw2+TjYtEX5Eca1iTgszu3VS
 7zeadfrYqsI6TOVwdZJOnNCL1RrdSer4rLRaBqcJkp+2myeNRvKOE01MG3Kz31Qnpq/2IdccnJX
 6VlwISNQP5N/G96jCeDwj/dSwHebmeJPB549c4ov/OZ+1v1dORB4WW/C1rbD/XpF2ZaOq11+Jdq
 sp40cxTW92Zow5BpE/uFV35MHUET6CHNzLA2tE+jQCsbMlehen+KX7/50AKdRJIHVLmslFhQHmn
 PbR5L23Bon4Y8f7RHJDqcwi7kz455B6jXh6sOLxlUyY3KtKh/t+Kml6r6zU7ezkc2k3NEA843ex
 YVgO8jvGpsY+N/XKZKo5qspNFlp1yFCp4TxFSbD7iU/G4aLqMWEz796oJTT+ciG7biyW9dm6t8C
 GKCoRDdFJV+1S9810LQ==
X-Proofpoint-GUID: 3-akOo8RE40yzetV7h04ma3-hH9Yc0PF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_01,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_231601_602509_01A70699 
X-CRM114-Status: UNSURE (   9.21  )
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

On 4/15/2026 12:08 PM, Yingying Tang wrote:
> From: Yingying Tang <yingying.tang@oss.qualcomm.com>
> 
> Add support for 5 GHz channel 177 with a center frequency of 5885 MHz and
> Operating Class 125 per IEEE Std 802.11-2024 Table E-4.
> 
> Channels 169, 173, and 177 are in the 5.9 GHz band and must be disabled
> when 5.9 GHz service bit is not supported. The 5.9 GHz band is only permitted
> for WLAN operation under FCC regulations.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED06C5B552
	for <ath12k@archiver.kernel.org>; Tue, 10 Jun 2025 05:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=60ca8mWXdcumUxS5xYnjpVDopTkuXyfiD40TUr1y8Ms=; b=BPztYYB0biXyWYR8EPbQMWGXmx
	TMXVyka82o8+CVqR4Dh8UrqeU6xMuDoI7Tts3Q8wcw8quNBvunqLbJk2jZmnHXqm+oHA6OS1e1Lw6
	aMDk5q0LrAgVm6r75TzqBas0DJw0BrEWI4pmLmQGMtVpXTClw0ZrXaybFUZHXtKsSjL8y4vK2sTc+
	XQ43ObXg2ozsj48fxDpzRtKHDLLCfuxtw8VZ346X1uPknRHzZZGgnTO0wCBoefXWsDZtDiBnAaDCw
	3k643nqq95prjazBW1KNqK0TqivC47bhVBB5RLWIx3KgICB7BZLLlvQeVsQ9gHRA5DlhCOWD8GhLw
	Fn2iFOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOs03-00000005sfz-1Wsn;
	Tue, 10 Jun 2025 05:58:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOrxv-00000005sWb-3VR5
	for ath12k@lists.infradead.org;
	Tue, 10 Jun 2025 05:56:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559IVhf3005056
	for <ath12k@lists.infradead.org>; Tue, 10 Jun 2025 05:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=60ca8mWXdcumUxS5xYnjpV
	DopTkuXyfiD40TUr1y8Ms=; b=bh/4U1/8KDhLcsgcRATPKnqsEpMs/ed6nic24e
	FVuyv8OakB77WP2Oz1eihlW4DCJXvlBMUfFj7SeOvTdXhbNTqmFKjb2wC/YL+knT
	35DYql4m3KmNAhs/Gz1zuJ20DZ3P4VkS9LKj6IFBuBbF++hyxoYEtCTnexxccSzA
	5UbW//UBpe5tzoCZTksvdVFWtgztHwuJumIlr8mjQgUNI3Cjpkl7/PmVVzoATp2/
	F5KLedH+jvzdkuYThFY/ytTCjoAvLv8h6iz4XRrxqMO0KVWy7lj9xeMllLXcTWFW
	1r5bqv/WiyordbHr489oaC+woxEhm8cm8AamSf/6w71ghZzw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcg4j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 10 Jun 2025 05:56:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74292762324so4784730b3a.0
        for <ath12k@lists.infradead.org>; Mon, 09 Jun 2025 22:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749534966; x=1750139766;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=60ca8mWXdcumUxS5xYnjpVDopTkuXyfiD40TUr1y8Ms=;
        b=D7RYOGg1qypSpzJeGSicAF/6xkgEog7x3i8S9YMSSdIfOQzqpnEp8VbsnIpH6aqmJC
         OvAjKU8qygboYT3hmCU1co61EseSivsBwDe2Er2TTOHzQVrjPakv/QyKNjYA0QAfZSiL
         j68PEhy/L09jUPz73l3ZlhicVy6kucRK+pbycY5n4jcqMWdG5fz9W5ZL6DbgOe6dbxAv
         dqryZLSd6veEAKTD3Mo3WxJq+tK5xxeCJo76LF8tKup/5Alt+Kz4KgAcyH5l+9yLzsBd
         ZTFXP3eGxKUL6kWRY0jns2WfZCThmaPse6jChCVxkA7J5qI4xuZt5cxuz4vngmpGEPfm
         N8vA==
X-Gm-Message-State: AOJu0YwRZ7vsNeeNrnMN0U3TONgdzS2jTZ8nUcMmMIy7Z3XJz4EFaFt2
	5pEITc0UBsr/ivYC4/df99qWeBpmjR1Ad+1NjLjw93Uc+yh2tTWbj8ZCFH0ZYS6MgkGvVGkYBHd
	G88ANtIZbNlTSNLjBjG8vyPrVYD0bRt6S5Yrn3urHZHyu03mVxOkP5IPeWYuWFvVaO1d1YEdVrA
	M=
X-Gm-Gg: ASbGncvjFkWwnXuOzk/iudQiWoHs1sOeoIz4TxnTmwOdJoouKvAkg3Ih3hFGMFwGoJv
	e1W6s8s8RVwN/pdxVxu5IXa/kxjRCWUYmZVSzLoiI+/9bFmF/6jmn0dCFeXMwszzJtiR0LPRKlV
	6DD7CNGhnhum51L0NQMYgW1n/lCA8xSXGptw3aMDPcFXOFKMBgFW8V3kPnA8NvWRCfuN2RTTUKa
	lL81+Ot6/ytHreqkBjfNBuw/+qRt8EFFeO4I97XfX54lrEjwvwEKC1jviTozm9kvodPCCwB685A
	V2e35ADcJRIqm2p/BOVy6lQYZyXYvCL7xaSXLahg1o8gYCkFjiEHS4ydBFS+tfHWk2eFJm+jG40
	KY/xQDFLG0X7s
X-Received: by 2002:a05:6a00:1741:b0:746:2b0d:767a with SMTP id d2e1a72fcca58-748618675e9mr1676687b3a.14.1749534966253;
        Mon, 09 Jun 2025 22:56:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1fWgzQ/7GSIIOQDfFlsMXQl6wXZ+EvuFz7Nx7I7dp9MOc9aeQXWtCXtP5K8u1jiU22fuI6Q==
X-Received: by 2002:a05:6a00:1741:b0:746:2b0d:767a with SMTP id d2e1a72fcca58-748618675e9mr1676663b3a.14.1749534965770;
        Mon, 09 Jun 2025 22:56:05 -0700 (PDT)
Received: from [10.133.33.170] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c05d9sm6876277b3a.132.2025.06.09.22.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 22:56:05 -0700 (PDT)
Message-ID: <81d2794c-ac3f-4917-9267-af91afd4baa2@oss.qualcomm.com>
Date: Tue, 10 Jun 2025 13:56:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Lingbo Kong <lingbo.kong@oss.qualcomm.com>
To: Benjamin Eggerstedt <benjamin.eggerstedt@gmail.com>
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        lingbo.kong@oss.qualcomm.com
Subject: RE: wifi: ath12k: Attempting MLO with main (6.15.rc7) for NCM865 /
 WCN7850 in station mode leads to crash/backtrace
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA0MyBTYWx0ZWRfX7pUkeJPTsMPK
 qXwdtWfT+Ite0p9gowZrZcvt2F2KNi49T7cHj3HwZ4RdMG7rYs6VjOsN8l7xbr4Wdwzk9I9+KVF
 gy/cQc9FUElSR7cFJq46sJZ2yOxUkjOLYJ0TxvAG2QRiFEkVkNxTRX+RjOfmmmCMnItRpB0fVE5
 X7qqpeCGL9PNj3SqrH6pILKs8DnUxV9aIZIPoGui6/CRs1xeOm01gBv7kpugM4CTTK6KPzYrokC
 gaTAfv/ohSSSvKg7Re1hsaD/MgpdB3llIiMCVVicznSLg6Lb4iqjXrFiQBLFTRLjqmU1UZFMXyc
 xcPaq1KW3g2hVFjqKtMap/hlHdvpvgIk+M8UwNhax+UdCblhWFi35qFGWRcXl67lnCOawTcaZEm
 ub438GTKzlCV7nLudGtHfKDMDqw20weNLED1VmoIOAEhs/NX4oUrZJlbs7CYhR1toJzJP/Dd
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6847c8f7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=JfrnYn6hAAAA:8 a=dV9zNN0vQEhCFTJ0q7MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: zgkaFiq7AROv5hqOo-csjJ_kRRcvhnhQ
X-Proofpoint-ORIG-GUID: zgkaFiq7AROv5hqOo-csjJ_kRRcvhnhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=941
 bulkscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100043
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_225607_881340_40DD4790 
X-CRM114-Status: GOOD (  14.11  )
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

 > -----Original Message-----
 > From: ath12k <ath12k-bounces@lists.infradead.org> On Behalf Of Benjamin
 > Eggerstedt
 > Sent: Monday, June 9, 2025 11:56 PM
 > To: Baochen Qiang (QUIC) <quic_bqiang@quicinc.com>
 > Cc: ath12k@lists.infradead.org
 > Subject: Re: wifi: ath12k: Attempting MLO with main (6.15.rc7) for 
NCM865 /
 > WCN7850 in station mode leads to crash/backtrace
 >
 > WARNING: This email originated from outside of Qualcomm. Please be wary
 > of any links or attachments, and do not enable macros.
 >
 > Dear Baochen Qiang, All,
 >
 > Thanks for your responses! I travelled the past couple of days, thus 
could only
 > test today.
 > Your input is much appreciated, as I could make it work as you suggested.
 >
 > Should I see EMLSR support?
 > I noticed that “iw” output no longer has a TX nor RX Rate:
 >
 > debadm@debian:~$ sudo iw dev wlp3s0 station dump Station
 > 88:3c:93:01:ce:40 (on wlp3s0)
 >         inactive time:  5516 ms
 >         rx bytes:       22028457
 >         rx packets:     252577
 >         tx bytes:       5495523630
 >         tx packets:     3582735
 >         tx retries:     0
 >         tx failed:      0
 >         beacon loss:    0
 >         beacon rx:      0
 >         rx drop misc:   14586
 >         signal:         -128 dBm
 >         signal avg:     0 dBm
 >         beacon signal avg:      0 dBm
 >         tx duration:    0 us
 >         rx duration:    0 us
 >         authorized:     yes
 >         authenticated:  yes
 >         associated:     yes


hi, benjamin,
the tx/rx are not shown here is because this situation falls under MLO. 
you can try applying this patchset using git am and set if it works.

https://patchwork.kernel.org/project/linux-wireless/patch/20250417045709.770219-1-quic_sarishar@quicinc.com/ 


https://patchwork.kernel.org/project/linux-wireless/cover/20250415042030.1246187-1-quic_sarishar@quicinc.com/ 


/lingbo



Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F503CCF9E3
	for <ath12k@archiver.kernel.org>; Wed, 12 Nov 2025 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=; b=Y5lE9U3btCkPO/YpIMtP5LKecF
	PLOF+4/9lYyh3yT5v71c/aiXlfW9KXye4iXx817+z3LHt1lwclCDGqIAkgSYce2+JoaL+oWCwSvjy
	Zl45UcDycG03J1Iv65IZjfRzF/CUZVWNTZYSbQwMFMgpq1BcesT0MhoB+gN6zDA3pfQarhoJkqIT+
	gk+6ut19Y8hM5dlZ9Org2aCPlKOI4m56OC3oCJGCnpE0pNk1neQ/IARsB13RYGZqPq/RccrHjvgQ8
	eET2kzu/JYphaDlSFZTSu6akx+tuVn0fxz8Jr/NMRE8FNManYZQpCw+lxVYWy3Nn/VH11TSFeWvyx
	tq9LIZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCIV-00000008zrU-1D6k;
	Wed, 12 Nov 2025 14:58:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCIS-00000008zps-0HF2
	for ath12k@lists.infradead.org;
	Wed, 12 Nov 2025 14:58:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ACDDuNH3502408
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 14:58:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=; b=DA9iyE4n3zka01QN
	OUIbgpHWWC9iG4I8kOUZbbUvhgtSBxBsSBJCx/7kBKprUT91XYewhio0qTE7TUDS
	tiMPYsG2UOPLpqOHZAywGnB4VGLq9uFS/RxRYMJOkGcxa18lxGjuQTxTV74fJtJ9
	6vqXeJ/E/TWZCj2pckwiWAvGG/HKn/XYeb15f1FYlfZrXu84aAYzL6S5wWl9t406
	NZSuYzjgmNjdBVzYLXvaoFKUbpZCXAh9Txh5hiwFbuux18W+u2tP6T27QhL+uO5y
	gEexHJEe+6oW3HkRS41icujvflfOWgqoU5XD4f0Y+0cSzLcqH7GDIP1yQ+YOD4mE
	c9DZEQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acdcc2us1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 14:58:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2956f09f382so7805815ad.1
        for <ath12k@lists.infradead.org>; Wed, 12 Nov 2025 06:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762959487; x=1763564287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=;
        b=NWeyIj8F6eC6RGAddsgQa/R7hSAipfs6L1J78WA9jQaG/FPBJ/v6m4ulBSD/PJuGWB
         VfgsnlSmKXTgBXNEMT9iDYFOVog+nPI600TW2ZrHkF/6bnOPFyQN9JYno6cSIDXCEkVh
         PwCEm3dVOj5kGJ7xXOHKhFe9Hm9GmVXwOE+6bM+3xY+QGmw8PCxcI0WuFVpoTnAHYP7o
         qhlRn9KZE7XLCwpVc70lPaYfuhPJz8UG6+OhHgwhvN+XU4KYr5uPblO1S1RESKhcyFfK
         HuQVNIXtpiGLB6bPEoCsO6zKLuaDIFRwgSArSleC0OTvPrOLshEA+SQLnSN3bBJvIR3O
         6Ghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762959487; x=1763564287;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEROVcmd5veCgeLZc8ZMDHausStHe/ePcLVUS1KczXw=;
        b=l4anwLSycqTRmRkRoxjXvDqIDnZsHdnPImaZTeG+eLhBIs+a1cBbHrjJTcJmCKoRA6
         UHIbqsIKlV6KkHq9XhQPtBHrUPH5biRl0kSpK5+EhekNct3ODO4Sd2/kp/Bv5T5mPUP6
         z+iZmivZzNJEQAQmqOjGcAftQmLq+v+RzlIn5Jqk9LfxI7ByP/eZOEo9Wwlm+8cFuFJJ
         8KKXGYpCcJ0Y8Pif48/SdLQZby/ZrzkhW2JFA8olR8yGOnc/qtnZ4mfkPqdtieL8RfMl
         Nqplczy2ntxvErMg1RpJR87UaLjdoCnPbCWAHfcq/3HgY4023WZCQIF4OZbzJCk5h5zJ
         n5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCM0ZZTVmPjxVREq/IS/R9eXqKaYS41kMcJywwl81mO7EIPSi4KijLC8tYQ7C3OC8jIHc7fJU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMiafJt5jmZaT5mf0VKO7tOh3ttEDBehjQ4jRENv+s5Io35aQr
	OJeutF3P3At3d9p2pzqSl+ipp7UI/KC+kBQyrYRR98Mp5v7Wy5yCdf1v7vgf5H5eJJk7eIDI7Vm
	OFUk4QfiM55uZCaJpckkPVMkNC2peZ5yS++vCgAk+6DQUBTky84aPQE8OkHnkKn/J
X-Gm-Gg: ASbGncuooFhzNyiqnEgUTA5ppK8fFhaXVKc6ULVRF6QsBxnu1XDrkGCanBm1aAjI6YR
	tK/rNCUEuFT5JBy5zkXl9woodYZW1MdDQWNgVODRKWlq+RLwYzF0E6EWJ8J2vUGmQHguSQQXgSM
	gbVZaonX/zFohLXxTYzAKb79g4jq6kxzxL46Rm81XNdlBgGcElcFj8HwGCMgHullfuZcznM480R
	kYonbWiAh61BGkX1zGb+FEWVbFkxDrWKgXiaaAwVyTUX58Pus3Ab6GiprhAEyZkN2GF+8i3GArn
	bKxamTmS6HXIHefa7wr5fegIbQtWtX7dGIvpavGENmhq2vwdpYzgsy/DHmBn6HEl/fw20o0m+i+
	YzLpGAzfK1+engr8B3vdMEdWgS4FEQZQPe9g8HPZW6XgdvDsKRLu+h1OnsV0=
X-Received: by 2002:a17:902:da91:b0:297:c079:4c32 with SMTP id d9443c01a7336-298407db038mr93804035ad.11.1762959486792;
        Wed, 12 Nov 2025 06:58:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrpn0fT+xmTQ2KE3jNXQxBgiCrfh9f+Cowdb1Z+6u8BAS8ehhTTnn4URI8fzcTRIFNufHZHQ==
X-Received: by 2002:a17:902:da91:b0:297:c079:4c32 with SMTP id d9443c01a7336-298407db038mr93803555ad.11.1762959486231;
        Wed, 12 Nov 2025 06:58:06 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc10c573b3fsm1834473a12.34.2025.11.12.06.58.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 06:58:05 -0800 (PST)
Message-ID: <c18877f0-1b48-466b-aa20-6207661030fe@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 06:58:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-next-20251111
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <15a98cae-0274-45f4-9b8e-be6fa9720884@oss.qualcomm.com>
 <7d445736914f971bfbf89b3480cd6552434eaf7f.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7d445736914f971bfbf89b3480cd6552434eaf7f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NvAMrR6n5e2RqNgyFZGQF39PGpSzEwmE
X-Proofpoint-ORIG-GUID: NvAMrR6n5e2RqNgyFZGQF39PGpSzEwmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDEyMSBTYWx0ZWRfX3OkmO+N1zTB8
 BE0UXqO679Mp7iB1fl7KNJUxLwWYd9xgn/YaZ/UAYL6ID7Yg2iGtRiy4AYtcvxktS9Wvc0A6L+9
 0tEs//twSYeUXwNnAr/Yv9j6q537KiSHh8cUB+5YJw9DTjhHqIjrw1V1QNmK4n8gj+2avX8/gaX
 tta0jr84vAYcq4wfOZXXQjC/2eAT94SH1ox4VUYniSJaZRzX6aII2f1Dx7NQXBX6meuzk5YvQI4
 dAv/WFiVc6WvRBFr7o0oWdzAPMfzS64VjwfPgBYDJez2jQhJ7QXG3K6A3jDrEB7BPtw9jnpt0Dc
 PztRqXTJUBZLjRojlI+gv7NkfDN+t/Sv378lwtHvbX/O528aEiF1JzMrpl95nwBRh5UZ8khS37b
 /A5zKPKZb5lfwORHpb6n8gxaZQe45g==
X-Authority-Analysis: v=2.4 cv=L/0QguT8 c=1 sm=1 tr=0 ts=6914a07f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7SW9FmOQa233CxgTmL4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_04,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_065808_103347_C3F2DD2B 
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

On 11/12/2025 3:51 AM, Johannes Berg wrote:
> On Tue, 2025-11-11 at 09:28 -0800, Jeff Johnson wrote:
>>
>> Once pulled into wireless-next, ath-next will fast-forward, and that
>> will provide the baseline for merging ath12k-ng into ath-next.
> 
> I just sent a PR to net-next with this, so you might want to wait until
> that's merged and I pull net-next back, to have all the current net
> content as well.

Will do, thanks!

/jeff


Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62844CA0EC4
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bwoe2afa48ujS5/V/Htdz14/LSDLiFIiSlrAiWittNg=; b=NsAeOjsR3WOkblUbdzEbY8CJtw
	vK0bHSnzu5WEGOhFaAuhUMKzwrqzlsXOOp0VWZCTRoOaBmE0lRWVvLEd8k7wTUL8JugMkjFeL8eMx
	fSrYRMkGS+YCXXgHDhtUmaTPg2Kfi7xw2YYei8A7GcJFuAAKK0DNgCU/vV8mS9ExdUFiT3Tnxk5Gr
	FU5N22H8/mDrMKJIyB0X+Uo3kdxwZAQOu0G8SEtAkHoEEgoxM48WP6J4vSnfNQnUid68XA/2JIb79
	wwMXtiFhsKt3e5jqeu4zB4hmo59Q2j2VxFI3oyB0PmaxbSycxGNhoDwBgOUAQtYMphfTKPS0CDTkb
	0yWHUqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uluaw-0000000BnJP-42Aj;
	Tue, 12 Aug 2025 19:23:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrOt-0000000BDzb-1aS4
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 15:59:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvfur020378
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 15:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bwoe2afa48ujS5/V/Htdz14/LSDLiFIiSlrAiWittNg=; b=a4KJ88+4gzUNJG6o
	oVPZB7Mv8DydBsggqv1HnHpLVZwq4/ImiQALVaVDqhmZV/c8du/lvC6OkCiR2LJF
	X2QM7Pq5x9J2IESwh6oa/vuA+g2x3zrHNLMxvJkNnDwJ/vpRgIoZHH8+rMSeNWWV
	5enbPcX1umKliXnfHDKUUXijpOAm0SLWy3iKn29zQjPuRBMgpk6g667gg4kFs9yF
	igG0+AUtVBmdwzPAWf6aIJF9rJRl471nu04QcSHxCGaszkf2k3g7TM5+tZa/cEwP
	DKEz4CsGfSsUuaUFA8cNKYWdIClI68A+/5RIQFvOfGyrCePRYyu2rVZpcrW3t6Ts
	tQmSzw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx6vf5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 15:58:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b429e665c7dso7491292a12.3
        for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 08:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755014335; x=1755619135;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bwoe2afa48ujS5/V/Htdz14/LSDLiFIiSlrAiWittNg=;
        b=u2otZK8ED7SL63kUA6yxoKHf3B9fAxbIFlJ9kvCVpXJHg8narvGEInzArktSq7+bEM
         JxrBSqSqQf8eRLF00eVjWFP31O98YxfNU0IkwIf7DPSucOXxH4jmD8ZmiJ6kMytPWpfI
         YngFIDvadc5HKXsv3L/chu7e3WWWbibHUpnY1Z/nzYt7ljMaDIcQo23s/ooi89MK/ayB
         J9/D5+U2s0rTJ5zKczzCe/bTcdQVYcIAdqLSk6vKWYcTJtE9CQWEAmtuD+lSpC33LPQp
         Oq0xSfIq5SFkpf5Rk8lVun6jOgMJl2NcE+rZ9dqhdedediDBoE0XIVATTyzhslwvj51X
         r3OA==
X-Forwarded-Encrypted: i=1; AJvYcCW2NoU0mTD56zjJeSDIurWmahJIXRZTpZCvpnJ2Yg8l1dZjoZj00nMsSjeBhJekpGIrvwZ/QL8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbeUuTJEfAlwRSI7pBwFd/msBalUqdm9oe8CIaNn5CWQf9GEep
	FV8keanlExK0o6Mrp/K8wBvwSgWuByol2XbyUSCcOGWZulintIawOS44QlTiCDbw8wlZuZ1jU3A
	qbFVLyrAxzzyHet16e68XnEqMIIyzEXOWXgxpOgwCbWAy+NWuWKPU2NdP013JMXIs
X-Gm-Gg: ASbGnctmCmIeq613THxSyzKofUOyJtDrKBhX3/9KjccTpySjcjy/YYbxgzYyCLz64oO
	jtANdgU7dFQyA7FfqRWxBPIoDo/8XP6mIe29O+xol1lDg+PLLdFges67BmpTFDYhJo8qhGT1Og/
	b+5O6DizdqBIGPk9FOU/xPVd1xLRl2Y4M4/J/HkXWDMCdzzbcf3+AdE5RRllGT6GqiYW2mQ/zg2
	j7bWv2rb6bNMwwhvNQ5XtZ+oUsFCEEks8lHT9T/l1p06ypcTlOlcCl7S8Q3MNFtOv4zClDjHQVE
	2kall0w0jRMVbfcV45owSDgdLuRnLLL+kTpcGMPeKyIbWhziNPzTJt7muBIu6zYs82kDZsgftFL
	WXshy48W+NVgEz2jit+h27Fld8Giot0A7
X-Received: by 2002:a17:902:e889:b0:243:47:f61b with SMTP id d9443c01a7336-2430c11e1fcmr2768135ad.45.1755014334696;
        Tue, 12 Aug 2025 08:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiaUWFnVGiPrNJ582E5fBjuSnhYrZtVZiz62WpdkRWMNIBQq9NnLaAArmOWl8WWLjz946MSw==
X-Received: by 2002:a17:902:e889:b0:243:47:f61b with SMTP id d9443c01a7336-2430c11e1fcmr2767685ad.45.1755014334227;
        Tue, 12 Aug 2025 08:58:54 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b423d2f4fcesm23976159a12.33.2025.08.12.08.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 08:58:53 -0700 (PDT)
Message-ID: <053a7887-c08d-4272-8ada-cf4a008894f9@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 08:58:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Stable Request: wifi: ath12k: install pairwise key first
To: stable@vger.kernel.org
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Gregoire <gregoire.s93@live.fr>, Sebastian Reichel <sre@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Johan Hovold <johan@kernel.org>
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
 <aFvGnJwMTqDbYsHF@hovoldconsulting.com>
 <2d688040-e547-4e18-905e-ea31ea9d627b@quicinc.com>
 <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e23d7674-31cd-4499-9711-6e5695b149c6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX5RAqmqzHaz1V
 Ohhl+nGIbo3zWFhUGiMkLMJckKs9FWML1V9Op/Dq4mTCB/SwT/jKU5uEpY9OPZIbWRjKbzZDHA9
 4VhVfeO4BdCIqm6+r9K/GcdY7Nhvaa5AJ5Kd5axEusHvRFdPv9vkMXyGG0fQMV6FXgv+Xx50Cmb
 bZJZ/cQ3FPQv/x5M1DHoyMljCBsCvczjUfG4rUn9ChY/clKWXShgednMq+cO3u7yVs3oUN4V/J+
 Rqh4uWpypNmBreMlYK8j7LIKa2ZHCXfYLv51CSCCpnapVye/Wb4pzLRO2f8dJzLfIqP0VSosEUw
 3MUvPLwlFK++FntXkYUNes8nEGnT2+AITTcQ3hPjclL7UClVRAGugk6DLC2liAocQvV73Kfalpi
 qR5QVIcR
X-Proofpoint-GUID: nuKwAQu9eJKvQ3FkTvkt5IWBif-5zqPa
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689b64c0 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=mWBu8RyEdIvK9AmNwbcA:9
 a=QEXdDO2ut3YA:10 a=1R1Xb7_w0-cA:10 a=OREKyDgYLcYA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: nuKwAQu9eJKvQ3FkTvkt5IWBif-5zqPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_085859_543354_F612BF49 
X-CRM114-Status: UNSURE (   7.87  )
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

Stable team,

Per https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
Option 2 (since the patch was merged before being identified for -stable)
Please consider the following for -stable

subject of the patch:
wifi: ath12k: install pairwise key first

commit ID:
66e865f9dc78d00e6d1c8c6624cb0c9004e5aafb

why you think it should be applied:
This issue impacts all products that use iwd (instead of wpa_supplicant) for
WLAN driver management

what kernel versions you wish it to be applied to:
All LTS kernels from 6.6+

Thanks!
/jeff


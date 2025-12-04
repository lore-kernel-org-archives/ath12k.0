Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7D2D2444B
	for <ath12k@archiver.kernel.org>; Thu,  4 Dec 2025 17:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QmObOsaJbDiZ/0MO/HFmlr++x6IQpUEvofZlXG2M/c=; b=YqD9r3NOFHRJxoxROftofA6+P7
	GKMjMYjasLlbCZm2y+jfK4JyZ5Cpxfpr93WQ8dX5POEGRnR0LQQf3PRQkfw61WNMIOlnlymE0dfo+
	BqbG66cLc1dYXKPLyrIYQESN4AhzlqdXyY+sZ0f2NjqqV4yw8gfXdqdNWmn7NSahed9BUG+9A7Dnp
	Jcf/nitOMzboDIEZrmz5QsYRhHErKNfCBeIUU9WyjyaXnHJX4DQzQy23aOU5GCYNpUmYKlXYXmMCi
	xh+q3kxCfilCNFzzmeNg5oA7NzvwWHdW9XTKVOI9vXZ2MC9VjwF/ONHySggXcJVS/k+foXFtGJI03
	Yc8U8beg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDIa-00000008OFf-08hR;
	Thu, 04 Dec 2025 17:39:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRDIW-00000008OFC-44Mv
	for ath12k@lists.infradead.org;
	Thu, 04 Dec 2025 17:39:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4B0xCI614240
	for <ath12k@lists.infradead.org>; Thu, 4 Dec 2025 17:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QmObOsaJbDiZ/0MO/HFmlr++x6IQpUEvofZlXG2M/c=; b=LyGqZCa3+PDFZ8zp
	h/ovx6lzH1G04wdGVtCsoLszRL0x9ovnNNDPG/efmgWnKpP2g2Vyo5w3tr4Y42WM
	iH8dCRzWfV05+oXor2BQYzzKcQVNZPS6QYsLLQg0HWgk6N0rtoJVRs8071M0Wtf4
	CLp77iq7N5QJPaaUMrBpH6ZJJBLN1G+g2kW5CQkKRMCbT5gMeIVc7ek44WlLNfQq
	tkNUk6iJ3vU7D6ZYZ+vi0zMBowJUlOb7jf8MHigA34eH66R3/pfmPd4wGUCdaASy
	/AU43qgh4WUqlAl8s2GmEs01+KZFovaNtqtSO1TwKyrN2T4Ksdy7Hn2TjtWStqy1
	fEhZVw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au92997f8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 04 Dec 2025 17:39:20 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-3e897d89821so1722169fac.2
        for <ath12k@lists.infradead.org>; Thu, 04 Dec 2025 09:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764869959; x=1765474759; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7QmObOsaJbDiZ/0MO/HFmlr++x6IQpUEvofZlXG2M/c=;
        b=ep4deXr6E/LYMZ+guJj8smgxclCob4Q69em2MY0iBPkdRZyFvwcAC0W511v+RUZuRs
         jqala2BGh63pZCYuVjarGJ0GsqqS86VRHPQrxEUo5aj81NhkHv3fVI4eIvuXmcqlhfWh
         ffMa9G9NByU87+Vi/PlUDX3eV8SLnhZxYZn2c8Bburuwen7nYlSNWKBonF08pOADGY9l
         /69YWe6/0W5b+URSFnN/x9xKHqjrt2bikSe10ced05cn+xM/wLDh0tBpiEW0ZniRe4rt
         /lW8souSvrPefYh+fZQaGZGT0GlBrYF1d5PZTjqqc9z4wASVBFSXcBmIHj/r//zWaNnu
         Xe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764869959; x=1765474759;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7QmObOsaJbDiZ/0MO/HFmlr++x6IQpUEvofZlXG2M/c=;
        b=VYTAd2AVdlZrVD/jHPewIvOEHQgbGYiMVGhNX6TzBLDL2xUSSfxYTbVmJ/3IsbTqbc
         TrBKk0BOSrmA6ZgtCPvTuwTTziuV9bIR8Xivl0Ux5niP8vzhcWXGdK6Ku7ml0dLd0S3x
         0Q9fo20nXqMTzSIiKuJaTtr072CK/unaNkz+PDuykmRi6JZu5JfG2Wu4eMe/hxRxpZtg
         e3Lqk+7OjZ6m9FCI8P68yZd2/jv7H9pmDcxUX2rA/BUHiXKYSM8U14Nrc96zPU7Nj2mK
         Zd4lLklBrRlqAlxKkRRHZ3W7+brEB93/7uugA5nvGzBV/81MccByJb4quabAu+OlkVhb
         uGqg==
X-Forwarded-Encrypted: i=1; AJvYcCU1lhLCnzN7TMBXqcDEg8NQ8aRNT+Jxcya5dNodxHq+rmfXEO6asbQQwPURhk/AuvwsNk6lr00=@lists.infradead.org
X-Gm-Message-State: AOJu0YxPtLKjWuUo2A4h+QcI237i6Jyep+DHdCCAwRXIWwDi8dza+sLA
	ZghTYQDCOGA2ZFBhHQ9JxBW/k57Gpvlrq+5IdBbHWyLyuJdAadkH2qQlTrkRkF7t2KFGCY2ZI0w
	SP3jYK09iH+XZH3/dt1BFTF3I5KW1l/gbTd/OTIHYuEb1AFAo71QThIsTPMB/vchuoeysnDtd
X-Gm-Gg: ASbGncvubRkH4jEJp8Q+z9/d+FWJo+S1Ej9A6VvIGEc7ocxpcy2T8A37IUHwzeRvgsT
	no5umobCioOrICoaqy7xL3DZ7OtVMJSIAhP7ir/0YwqtHg7FjUCaRnZzyJWC/4amjjPYsOnkv5b
	9htYXl+VXGnqI0V/ZG7ZtVTtOchIAbz6az3rJ6z8qeOMYyDPZgH35Dtz3XwZKJYqbJwBNehGtGb
	smPjMugASO0L7n7nJO8yg5yXpXvS3xIBZWd7YzSkf9HFAbkdESn0u9vImuj1QgiL9l89pPK5GXx
	GVpRT6/CZLkpgw+T8a8m+Ah4DT5WztTAg8GcqPW5yJv41igbVN5OAnMUjVQNtnMhe2nn195AsdQ
	FP2wmEpzT+r7BKG+LRpp9pQaA/nUXwBA/OZbIPb7Mq871R1D/WAy9Eo7m5QuV9aVFAB72Pkv+rA
	KQ
X-Received: by 2002:a05:6870:b686:b0:3ec:e09e:454 with SMTP id 586e51a60fabf-3f1693bc2ccmr4642123fac.37.1764869959104;
        Thu, 04 Dec 2025 09:39:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH91xla2y5LE2nOabc2sgO0okZEA36E8rU06HNqJYmMWT/s/eqAnWauTHbiqxV7+TIkvDv7yA==
X-Received: by 2002:a05:6870:b686:b0:3ec:e09e:454 with SMTP id 586e51a60fabf-3f1693bc2ccmr4642101fac.37.1764869958698;
        Thu, 04 Dec 2025 09:39:18 -0800 (PST)
Received: from [192.168.1.3] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3f50aa34d4fsm1660978fac.5.2025.12.04.09.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 09:39:18 -0800 (PST)
Message-ID: <cc6c7447-5420-401c-a880-320de51d33cd@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 09:39:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k wrong MCS rate in monitor-mode
To: Frank Lindner <Frank.Lindner@ghmt.de>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <DB7P192MB0329B1ACC97E5BCDFE1C37A5EBDCA@DB7P192MB0329.EURP192.PROD.OUTLOOK.COM>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DB7P192MB0329B1ACC97E5BCDFE1C37A5EBDCA@DB7P192MB0329.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nletrkIeAMrfgSxyN3pi-LBYZs2WVgdp
X-Proofpoint-GUID: nletrkIeAMrfgSxyN3pi-LBYZs2WVgdp
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=6931c748 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=GvAN5uU4PxboOk-AIKsA:9
 a=QEXdDO2ut3YA:10 a=eNH5niYpQkIA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDE0MiBTYWx0ZWRfX2LP9mcnYJqUk
 CONFMYOFVPutK89GyBFszr82jIJLWy0mfX7VuNMBPdQfHrcarfNcyV17Rw3+xj/InwgtmJVu7RZ
 NqwaEA3fVVomr3wPck5iFN9CnmNJ63FVV4yEvK4L91p/gT5kW0tYF772Zi0OBkWP/xy4HBYhEy0
 NdDDhwp8JccrZQ8+dl3GM5upslT3Ar11iW6hN/msGaA+F9qF+IZRb2RvhkahfhZcHPx5koejYXR
 KE3JGVdjiZMFlF6HzyVYxtkVZCA2RxWiy9wb1CGPDxaK85RhFe9af/8aFiAWojlxCBpGzsgO7AB
 WrMAgrI97WZR86x6Si4JEiBfok/1TewaDcl3DC/RgtM/iTvjdIwRMgPqhNPwkLQmPpPkFTiUv4A
 CHOGfdCAPxYT2+8nhKXtFKpsvux8Kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_093921_024839_86F4D028 
X-CRM114-Status: GOOD (  11.45  )
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

On 11/28/2025 12:02 AM, Frank Lindner wrote:
> Hi,
> 
> I am using ath12k devices, QCN9274 from Compex.
> In monitor-mode, all captured data-frames are saved with MCS3. 
> A parallel capture of ath10k device shows MCS7 or 15. 
> The captured data is a wifi4 or wifi5 traffic. 
> 
> Is there a fix available or is this firmware? 
> 
> Ubuntu 24.04
> Kernel 6.16.9-061609-generic
> 
> modinfo ath12k
> filename:       /lib/modules/6.16.9-061609-generic/kernel/drivers/net/wireless/ath/ath12k/ath12k.ko.zst
> license:        Dual BSD/GPL
> description:    Driver support for Qualcomm Technologies 802.11be WLAN devices
> srcversion:     555B1DBC205393C0C841332
> alias:          of:N*T*Cqcom,ipq5332-wifiC*
> alias:          of:N*T*Cqcom,ipq5332-wifi
> alias:          pci:v000017CBd00001107sv*sd*bc*sc*i*
> alias:          pci:v000017CBd00001109sv*sd*bc*sc*i*
> depends:        mac80211,cfg80211,qmi_helpers,mhi,qcom-scm
> intree:         Y
> name:           ath12k
> retpoline:      Y
> vermagic:       6.16.9-061609-generic SMP preempt mod_unload modversions
> sig_id:         PKCS#7
> signer:         Build time autogenerated kernel key
> sig_key:        5F:BC:19:FA:0D:D1:EC:87:49:67:38:43:F0:7C:3F:CA:9C:FE:51:03
> sig_hashalgo:   sha512
> signature:      6A:FF:EF:E1:BE:C6:46:C3:73:B3:15:B1:4A:B0:FB:9F:46:9F:BA:99:
>                 83:11:47:2B:7E:8F:88:36:B9:0B:BD:B9:6F:E1:53:6E:9C:BE:B5:AA:
>                 E0:FD:FA:98:62:DE:92:D1:7C:76:3E:FA:89:E0:7F:06:02:E4:F3:5F:
>                 D8:D7:85:17:D2:42:D8:21:45:7A:5E:C0:7A:FB:8C:38:14:44:32:9F:
>                 D9:C3:D2:1B:B1:60:9E:50:32:2A:B3:DA:36:C6:E4:06:29:D4:F2:58:
>                 0D:5D:98:08:A6:F6:D6:98:31:C9:AA:41:2A:80:7E:6B:46:0E:91:21:
>                 31:7C:2F:8E:77:78:02:72:72:17:61:17:46:F2:7E:D5:79:EC:5C:AA:
>                 29:04:51:83:75:A6:3F:66:6D:5D:4B:79:0F:CC:94:DF:F3:C1:94:CF:
>                 BE:A2:A4:5D:D2:C7:ED:68:3A:76:50:D4:BC:EF:17:02:AA:94:A4:DC:
>                 09:98:5F:5D:D0:60:55:64:F4:16:CC:B6:7B:18:DF:7F:8B:29:84:36:
>                 E6:88:5F:1F:DE:4D:40:EF:FE:A4:C1:C7:D5:EF:3C:59:BF:BF:47:70:
>                 03:DD:74:26:9F:03:7C:37:05:5A:DC:15:02:FF:40:E4:FE:E7:73:B0:
>                 DC:2A:EB:E1:43:2C:77:AC:53:BD:B7:80:C4:C7:E6:96:EB:A4:AD:FE:
>                 DF:25:DB:23:57:F0:3D:17:6B:7F:16:4C:4C:B7:1A:7A:EE:60:B0:B4:
>                 54:E6:C4:EC:EF:8C:0C:88:7E:6D:3D:D5:75:A5:6A:5D:AD:E6:53:6A:
>                 AE:5C:0B:DC:9A:24:1E:43:B4:15:1A:55:86:7C:0B:77:E6:1D:25:DD:
>                 37:E3:A9:81:D1:C5:0A:39:71:30:D1:05:3D:B9:75:66:33:9C:48:02:
>                 CD:B2:A1:8C:2C:64:4D:43:DC:AA:90:63:A6:D1:C6:24:28:8E:65:2F:
>                 5E:48:98:A0:05:2D:A3:3C:CE:48:E0:26:C3:E2:86:BC:37:2D:C2:70:
>                 BE:FF:56:50:94:92:48:AA:82:B0:C5:36:EF:9B:79:4E:2B:06:54:22:
>                 37:B6:F4:D8:48:21:41:33:83:89:E1:D5:FE:8F:78:EF:B7:65:48:3D:
>                 14:75:EB:82:96:FD:D0:FD:29:4D:5C:96:B1:1B:F4:E7:40:CA:FC:18:
>                 F5:39:89:7A:EC:76:E0:DC:84:3C:3A:C2:A7:CD:97:9B:2D:59:A5:67:
>                 A6:4A:F0:F5:B5:B9:C9:E9:AD:23:0B:36:22:62:E2:14:A6:3D:98:C1:
>                 A2:D6:DD:D9:43:05:5F:85:CE:36:D1:9E:20:94:47:24:E3:0D:51:D8:
>                 C2:55:11:CF:DC:B4:36:54:A4:60:71:91
> parm:           debug_mask:Debugging mask (uint)
> parm:           ftm_mode:Boots up in factory test mode (bool)

Can you please open a Bugzilla ticket per the guidance at:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

Then we can assign the issue to an appropriate engineer.

Thanks!
/jeff


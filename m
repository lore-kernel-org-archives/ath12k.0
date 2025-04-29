Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642D2C369DC
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 17:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BeRUPh5CwyEHNhQxM8dLF8a/Be260QZjKornLWq5+w=; b=KbuzdtRbE58mC+QZksKAhh9Uu7
	lo4CoMdFzzpxfeIzAFPt/7AXoPPfofCBvHtsl4dpnxXdguRFLdxvGgfdfXjCHm3IQjhUj9n3XE5e3
	oZN2lml6Ms/K4iW5wpIkpb2PHA1frXPKnm5VZvuHlBfsamOveYxsgDYCCMBUflmByGHLINKM1o023
	8VceUF8Ay7Cul7LvqvLhtfCqM7yD3UykqHga8B4WO1bMsxqTYu5NN8E+dHPXmv455Xy1zaet5Ui1l
	R6VLLZoe0hKJvOLwppYXtzUA9lX+dr1LP3q/oN6ECDnGfJQO7qgVdK/O2k6fuwyIH36eGuTnmsVjX
	AWf0ul3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oPv-0000000AMYN-0dse;
	Tue, 29 Apr 2025 17:06:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oOt-0000000AMQc-31YD
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 17:05:45 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T9gEUu021614
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 17:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+BeRUPh5CwyEHNhQxM8dLF8a/Be260QZjKornLWq5+w=; b=ZECioE4poFwTvAHH
	o+ImugQNlVLFd2N7tWw+i9FwKtPEUBDbHBbmNrhFOoAIU52FbVPeRih06dnjTqDu
	PVmESnMlD8UjkSOgLgQ12yK2aEOTPELIrshJMYJStSxSYEcjJqoaVudwqkgxrpPt
	m7ROOoDH08k45bAEmSIM7mRc0sNrtNDMXCqLLI6ZhSxD4Kgtb4tTEbssH2DoSNeS
	lc3MAWEyxb4/adZhqayAwvS7vS9AEs1qHJ9bkf98Fosnqj/FLKhIfykJh2QbXNts
	3igKP6Tv4svPd2DawmtqZmgUQtSlmE3obYvJ3xbgzi404f/vRv0OlpygF9sqNzn/
	29gn7Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5me3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 17:05:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2240a96112fso98156865ad.2
        for <ath12k@lists.infradead.org>; Tue, 29 Apr 2025 10:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745946341; x=1746551141;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+BeRUPh5CwyEHNhQxM8dLF8a/Be260QZjKornLWq5+w=;
        b=bJOissH1i93rT6KdQ9/Oz9lB0HsGcIIuZ7VORlRRE7fUw5HkRgLPlNQG+idzUuzUFb
         XlbraxiVl3QnfY6ZeivBBU0HMM87HSW45YAADWouSja8rFnbtgyh5lVyHbaOxQ/Py51t
         oHc2EUj5pt4r0jwQNhrz2C1YQrrxhAtRaWuXq4imOUuo/GDdiivQYj8rVlFmfjFFZ9uo
         FnLZDrTM7QT3a3sUAdRNhaW9Cw6lVVsTuMAliFh9UO3dui4jlj/+OXH5FYGDyjA35XuQ
         JEwb4WpS1Nd8iZ53f/sSd2lFsrtGn/bUruAIuSYYqt5lJBa402YnDZaDhbnl/u/ZOjso
         dpCw==
X-Forwarded-Encrypted: i=1; AJvYcCXFMRZOwOhEjvs9NCsp6LKJ1NcqSDiq2oSAZI9oNd6lGQTnSqAbOHi3pm3mr6T7LPVZ95LxFfs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd9lA5CFAda5KHSe1wMGRqq8qcjp+On6yCAs69OZMCw0fHqV5z
	kullEsVGUVjG8qM2/INj1LlVbNFPldf93vc60R4JEvs45RvabADMvmDRCL1AYFCdT7TcGf2vPXZ
	LPB0+UD3pEZmE/ynS6u6Yykvdp4yUoMCX3G2OXrNY8hSpjrgbRS5gc/Sv+CNi
X-Gm-Gg: ASbGnctBDF0g+NVxzpJ0NGfEWJG7o7TWLj+L9xvgSOo+urvpqvgPuQKN54QYQHZLhGA
	rXpiqOUIe4Wk5VpV6agPDr8MIPB2jR1Zu4KQnCL2nsUtRLqvdWKJHAEf/EeuXH7I4YErdafR92A
	I7JvZsNz9luUUuIavCw9ikplbluFjENACpm4W07zUIlEbiMix/oR1HSRc6Q0RZ/ql4d9/rtzOqt
	fySigZMzP0IyGVhsXPMpEo0tcGRXtVyY+Ei8PaYQmeZwAGykqON17eRPbTtsMfYMQHXXOnjlD4Y
	9Qk4zJVErKatq8qcE1nAu3YrwuMF89luF7p3ggPiHAvyC4hOGrbBUj4EvQ67f3znAl11qi1z7v8
	Cbn32
X-Received: by 2002:a17:903:910:b0:223:6180:1bf7 with SMTP id d9443c01a7336-22df35761f2mr1957105ad.42.1745946340979;
        Tue, 29 Apr 2025 10:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeKvxlItGhJsW/F3o2/QxuNoWE7hUAA2vJZ6boPbJqtL5VKAj5jHnUGoJ9xfQtFHQK5H/Wuw==
X-Received: by 2002:a17:903:910:b0:223:6180:1bf7 with SMTP id d9443c01a7336-22df35761f2mr1956735ad.42.1745946340640;
        Tue, 29 Apr 2025 10:05:40 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dc7b7asm105963485ad.102.2025.04.29.10.05.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 10:05:40 -0700 (PDT)
Message-ID: <97bea1c0-116c-4856-920c-08521d15f624@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 10:05:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: Reorder and relocate the
 release of resources in ath12k_core_deinit()
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Yingying Tang <quic_yintang@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250423055650.16230-1-quic_yintang@quicinc.com>
 <20250423055650.16230-2-quic_yintang@quicinc.com>
 <28403304-bb8c-432b-9130-40af69bf8c66@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <28403304-bb8c-432b-9130-40af69bf8c66@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: N7o1AWP-VkVTiuZUOSNqJd8kygkXhIK9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDEyNiBTYWx0ZWRfXx/KcbgTkZyCa aF9+INTiBIxXFw8ppKEuShB82+u23pxjuP3uRsHQI+CjdVfFI5byaPubfPNdKVRfK+xnOfzPIro b8CQvlfbH+UMF3v8T4CcUfq3k8xdZ10AxQwW4nk2162tqEPE99oJrGGk+8UwJgArwGE3COULSXM
 nK+xvqQ4+AcExwFmGZCJ8YKiinbocUX+dYOg1vQpuuQA0B76teU1fE+sZ4LsjRp3WcwVCcpIB+K CBUXTaLFMSBK9xsQfJfH+cSYWKd1iKsdL5zpXifqMExOSWJjgcov60BBA3bJ7zBr6qxUFpPcWwb 9w7nuhD80q67fq9l+qnifsPf0UIIptiE96G9OzfXLgTK0JHSf9jobmja1spDbCpYE9cofaEtQcQ
 gJuNw4rEPbEcBzeTUrKRzlGoakH0iei28jXjKfzM4U02L+CaTVSdVQLZl+OjaoTDWZ+woVqd
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=681106e5 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=j-zp8VNVwZ3Kxvef4D0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: N7o1AWP-VkVTiuZUOSNqJd8kygkXhIK9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=817 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_100543_784387_A6701F3A 
X-CRM114-Status: UNSURE (   9.00  )
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

On 4/29/2025 5:41 AM, Raj Kumar Bhagat wrote:
> On 4/23/2025 11:26 AM, Yingying Tang wrote:
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN8750 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> I guess this Tested-on tag should be
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Not sure if this can be taken care while merging in pending branch? or re-spin is
> required?

I'll fix this in the 'pending' branch



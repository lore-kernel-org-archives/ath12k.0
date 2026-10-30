Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E130606A31D
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 21:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PCaH04jc;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CypdlOSS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVvYKqJy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WyqmVzX7xZ8NzVi/5Q8p54DyZ0b9jXCdRbzCnZn/r1c=; b=PCaH04jcndxTZ2
	/UgkY8vCEdeuE9s3hY1Yam1vjMsOEhea866uOhkgs2iriJDM0Y4y9YlabuuNAohN7Px83RHfvlumY
	uZjApiFPAEyWeWj3mTVtceQw2R4FZYnmv2259nPM9E+Ko9XMxTD1i8bDbdO06h7Qg5SspHq8uXYLn
	bMac1fAbuKIq7JMVeffCpAfNwxMqBQfATa3jArfZQldnzW7m49qOxN7GAnbfiJ0r6UjluFTcNE1o5
	BkzPhQhv+GI5zzh9/Xhx4XXdWT4e1mKAQJ73511fzJitu2HkbLrp5PZi8NciK20zro9aH37m6NQQo
	3pwjSlPy4LXvo363iiqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtqy-0000000Cb30-03Be;
	Fri, 30 Oct 2026 21:09:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMtqt-0000000Cb2D-2jXv
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 21:09:34 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UIhwXl3776931
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 21:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WyqmVzX7xZ8NzVi/5Q8p54DyZ0b9jXCdRbzCnZn/r1c=; b=CypdlOSSajFHnoDj
	0/CsXLC4vGq2TCnPC1nXPvvQHSQL7VAg4TfLDpcT1JVA+2ZlBOj5dSs3+AyD/HpU
	ffuAalABjBiIwk9Vt2sxEsGuyD9363kEKlweElchT6MulJwLn44vyNKxYCuroV6F
	GC9aJx2/zSUjUI+1RL9bkNfej/6NITLxVXvrNTPt3vKAhLhs5OQ7V622HcRN/r9w
	KvilI34xeHRJ5V9OXq7X7AA3RsKYp5L9tGlGZZCqj+UbkfJS/OWsGkgOck1leZIj
	YDlE716cQUB6AwWMnldKmq3AbDMxk0KjhdIaXqQOYQo1jzoLqbRf1SJM3y+JxUpc
	V8kgHg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn0s9rdh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 21:09:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so1782217eec.1
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793394567; x=1793999367; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyqmVzX7xZ8NzVi/5Q8p54DyZ0b9jXCdRbzCnZn/r1c=;
        b=QVvYKqJygLoRTinx209aSBMAbbpQaReYTNBl8/pmVdotY6+Gx+I/hpdi8lGdmk2uuO
         wzSzkQUIgjtciKjLgfvsdXwP07TihTzWPJ0PC0RbEcPYoxOXfJLQtF6RxNoqHjixPtlR
         Bb0Jw6j9pevFRp4VN87L7BKv2iiWcYznVNUSpMC5m3jg46XofZRVxo4BxpU5gJzb4gT4
         nsLqNsASq1dbpRwgL44I531aDMDmH1T12gCOtiUBCjCSsRbQBiGD9z6lVcqSCwDgkqTM
         L4nPxfl8buO+vLnTEWq35bTb/x1Kg8y6ev5b7tMT8jB8ArEYSTaT7pixwAzJAyvjsGlo
         7ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793394567; x=1793999367;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyqmVzX7xZ8NzVi/5Q8p54DyZ0b9jXCdRbzCnZn/r1c=;
        b=H2R4UlV2/lhfowlnY7fQq1xYx5el49LHxpG2XRjRbPHMajUmPkfh5pzFW8+c0dVSRV
         dUF67EmtGVtetpi+N5OvMwSNW5sPWneXaoadBKjf9ifGiYGQ5ZSmiZrKKNk/mzpLrL5w
         1qO5qZZn87fGSopYdXBYVdS4cVa7g2/zKbJ3QOj0tGlhvjbE4AZ+/Pp1Ph2VlTMR4V1A
         Tka9iXcLuMPfsOp5KWqiH4eICuVNOmnJn30m2NzS789UjUDTmpOggT79TfV2hOPyc0Gh
         ynsqQK8en7oIDFv/6Ch0WaNhIGN03c29cVBuGHv0gdrsuNiDeD+bTYN/2bWWkULSTsuc
         WH1g==
X-Forwarded-Encrypted: i=1; AKwUvByxHz5W5HK4bV+OeFjSiDQnaoNZ06+uKc6a1egiK0dUx4aYXB0NjdTkix7cJ6Zu6xXM2mvNx+c=@lists.infradead.org
X-Gm-Message-State: AFq9FYIVR/kfWy5z4E+7YUgrgLsgvxgRDmQhTa4X4pw/29fKaqj0exZ7
	XZSdKOctGhVQ9aDX14kP0fbo0wo9Qjnft1y92ti2ANlN9P3mGxX4eqnBFYrjkrwve0DW7DHHnhy
	3DeZPr+2r2rdE1bSdFK9V0FEOLTatIzuo9qmWaRglmmT89v6HLNG8p+Jb0Ye0lTv5
X-Gm-Gg: AYBFou2z+v3jTJH8g05RMCS3im9vgogGDo8bjht833Lr8OFU5uSzNoWTS/oatZIQZ2Z
	V2v5S21aZS/Uy3J1+zgScF759jj3sNwxioIMUZ5koR2WPjgYSLnlEi9DNb9XVUGqnLgZwM7JP/r
	ULRm2GnD7+P/h9Yu4Ly6R3Et+iV3H+bcdbIcxrOPE+GdniM6NOKuAIN6E6c5NzhTUXG5FdNYLv2
	aL9esk3bJM4id9HA9JPZ1gMB2M9d12k+KziI1KhEKQq0hjvkRqaRfTg8zDu2uDgNoGu/WjFkkY3
	Gzh7iY958PiFOX7RsCx45nh1wcGRw+W7A/Q7OdFRlT+h49v2LiMOhP5wIdhPTgMKJXjba3jJCHj
	ioOxpNCOZARh5KDgT6hexr5d5WEjIrdGz8VjigIu+Vt2M98/rBJ0bIGEIbaDhcnQlPkdS6PP6Vb
	3M5twMSETDQvhETRg2w8fs0Qqp1xgWcBg=
X-Received: by 2002:a05:7300:c01c:10b0:36a:50ec:db3f with SMTP id 5a478bee46e88-36a50ecdd21mr1043556eec.7.1793394566687;
        Fri, 30 Oct 2026 14:09:26 -0700 (PDT)
X-Received: by 2002:a05:7300:c01c:10b0:36a:50ec:db3f with SMTP id 5a478bee46e88-36a50ecdd21mr1043508eec.7.1793394565946;
        Fri, 30 Oct 2026 14:09:25 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428ecb61sm8561611eec.10.2026.10.30.14.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 14:09:25 -0700 (PDT)
Message-ID: <44bc6f1b-6f04-46ee-8578-caff30ab25e8@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 14:09:23 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew LaMarche <andrewjlamarche@gmail.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jeff Johnson
 <jjohnson@kernel.org>,
        Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
 <179337193753.3936464.10436179036151297295.robh@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179337193753.3936464.10436179036151297295.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bPyDs/+Z c=1 sm=1 tr=0 ts=6ae50787 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=m8ToADvmAAAA:8 a=3poil_INJ9H8gjXqE2EA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-ORIG-GUID: ajsJZf9TUiFCsWfj9vcLzbYsbQoRJmix
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX1BpsAzDajXVf
 DVeUuUCum3UCpTtAsI7Txee1irzwR+vFmEXpYPbkKwucWzv7W09OyKpUnnIkdDjyC/O1HFpZbw4
 /YLnXQkT7Ql255wKLMjPeTo+zCqJgRfz2jl3dwbeKQQV7wsNp01898OzRPV+PZUSIOqyXdFEZDU
 jm2EEhiucshRnJFM3goJAJmAEM3kOtXqsfXvyx8kRhlB5NyTftG24M0rl9IisW/rpMbOL+iYgB1
 hy7r4J7fSHzKusAfXlkHMd1oZPqxF14ArzhuvYpLjB9Y0YVrH09cdSQZ/3YZTUyAPdmn85TnAl9
 nJVbzZMu3aEBqvFeq4vijhjNa9k9DZuHi7CxyrD18hQ0T5uy22XBnocytB1zgHaq3/3FMB30Dyo
 yeNSjvN+2HA4+P43MFnPix/qBenlNy79EpFryVibbYZIGb9R0XmGDW85Kb8W/qOnk7v7gjH1ZsV
 YKxxOwQ8Q39LdKsaGFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfXyuoBOAIrsCfz
 Dqi5dMxjHUCLpFcoGxrSsL62AJNM/vXiXykiLMqkK8G44pJO0nzaT6+k2/MM1n4YyqZJ2Tzcw4W
 e3RIywoAgc6UNgOWLm9rHRkYvvq+DDQ=
X-Proofpoint-GUID: ajsJZf9TUiFCsWfj9vcLzbYsbQoRJmix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_140932_592993_0A216312 
X-CRM114-Status: GOOD (  17.47  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/30/2026 7:53 AM, Rob Herring (Arm) wrote:
> 
> On Mon, 07 Sep 2026 16:17:20 +0200, Ernest Van Hoecke wrote:
>> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>>
>> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
>> selecting board-specific calibration data when the device identity alone
>> is ambiguous.
>>
>> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
>> device tree") implemented support for this property in the ath12k
>> driver.
>>
>> WCN7850 can be used in systems where the PCI device ID and machine
>> compatible are identical across product variants, or across regions with
>> different regulations. For regulatory changes, the hardware description
>> does not change, but the vendor-provided calibration data can differ. In
>> that case neither the PCI identity nor the machine compatible can
>> identify the required data, so DT needs an explicit calibration variant.
>>
>> The ath10k, ath11k and ath12k WSI bindings already allow this generic
>> property for the same class of board-data selection. Allow it for
>> WCN7850 PCIe devices as well.
>>
>> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>> ---
>> Changes in v2:
>> - Rebased
>> - Updated commit message
>> - Link to v1: https://lore.kernel.org/r/20260701-ath12k-calibration-variant-v1-1-d3eddaabf026@toradex.com
>> ---
>>  Documentation/devicetree/bindings/net/wireless/qcom,ath12k.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Sorry, not sure why this wasn't showing up for me. You may want to 
> resend it in case it is not in wireless queue.
> 
> Rob

It's in my queue, will pick it up now.

/jeff


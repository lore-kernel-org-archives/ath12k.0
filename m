Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED58E109B474
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 14:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duNzVU+fWIW2eMrS9MZLuIgJmindhQKIlaRaLKEtYgw=; b=DQESfykGrXX8HS7q0wAUXL9hBM
	uPBweTsT2Lk2lT4x/bZsGsHuvc7UYL7S9j8RcVyFLYXrmpxTf/RfdFeSkZ11u9560QByx0O2AH9im
	mhr0s0VM5tQUuU8dNPNeSuIN8hImz7RNr0mcGNu1iUEV3ub6bBKdE+QM+z+Ntll23+q+FNs9+C6qR
	gMzwW/GAU2gluM71YZNTUDPY3BX5KX53p5Oxa2TPXsXIQsQo4YwyguTUM4HfhND5bpvtfb9pIp2WV
	4sSZ5O+MgtIBeUeDRBSmTEpg6flkHS94ipnws0kudvrTffCaHGfflpxpGv9r0/BNLJICC+FgozCcw
	qoyicvOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a0K-0000000D5AX-2vGY;
	Tue, 31 Mar 2026 14:23:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a0H-0000000D5A1-3INI
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 14:23:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VDtAI2058040
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duNzVU+fWIW2eMrS9MZLuIgJmindhQKIlaRaLKEtYgw=; b=cS/61qhahBpznw2w
	0QHmxgVs99T5WU2CuzhFGCrnNcNvaS7cT7So0ybDqiStJ6ilogttCY780kzWCN7l
	30AxAHT0nSbZlf9VI1MZM83tg7BqPr4/gU6GB4xUq1b9KKCvqYdKR+pbzbCdg3sA
	yFlmfdPGzkA5el7lKvIsGXEeASWCeie/PNGtKiBtMEjWd+WQng9QdPl19+uh9q7t
	IQZr77MbHtssTUfi9fqkis9Uywiy3Hm2MS6561J2gt/YGNGHrBdFyvs3J9BoWJ4G
	0fz0Zft9J0dTkn8t6dsY+G9W7LZ2bGuteb+AnatJiOBb3A2Guo1lkFn1J6ZGlgNh
	krV5tA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8ahksjua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:23:36 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-128edc72e5bso2515560c88.1
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 07:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774967016; x=1775571816; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=duNzVU+fWIW2eMrS9MZLuIgJmindhQKIlaRaLKEtYgw=;
        b=M0bZ6lkhBayKgRQWYCZ2LOqMHaS4fJh8d6NPuYt8py3Es+IUy+Q2bFlvsUh+Ke7dCg
         m3ILjadujgF6wTgdq5acC5tLfxmQs119Uc3IOJycr4uSo9RMEMZo9bNVvg937/J8RQ05
         HfEs7COpkqCFqsCObbCxM+t2mhl2zHdDtzgzCA6Hecv3nsyfPP4jYuBrNJ5/YjM0Vs+i
         ZIpJOkZj01bX9pXblFgAbrp0rd6nvuRriT6anV9rnU1kP5ClzhjolbqcFXm7OZiC3qXg
         GI4kPH+9tGMyrC0na+N/i1VBYGc6PhTt4fVUhIa74M6UTDUEA8c1b0AX8lwJU/g6YRJB
         jGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967016; x=1775571816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duNzVU+fWIW2eMrS9MZLuIgJmindhQKIlaRaLKEtYgw=;
        b=RXjMw8FWhkuLJmwHg84HgfywzHXih+ulLOE7GD4uz1sfJ8+RFzYEhVXVsbRWiukYZd
         IljcrOaGTglA8jZ9+QdBwjhd0PIDW2Wt+JC7+5ZJLRr6lQGzUYWTVq/lt96af8vZvBN+
         tpguwsfGx+ocAudfakjrsfLAe0V2xJYpWvV+dcsM5PwmkXOZy34fJTPRO+fenBY2k6Z5
         Fk9lVVU7LXhIt9vKbOhWstinSJymYyjoUk3LEG2c1GoD6OrFrIBmCTWvzLf+ygCmLTz7
         58E4EJGF8jBTLT6Lfb1BpKY30EYITCAjh78S3pB2HGW63FaFSgela/KGevgNJTq0mZBs
         1khg==
X-Forwarded-Encrypted: i=1; AJvYcCXV4+m8LxTVWjeDC0Lb/mvCR2k0382XrUUp3+XpqtB7ZYjUG6E7c5ie+51TNUokfaDa2Qa1MCo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2T8mRzMZU9dJGZAVoBb/wUI46od7NiNM9H+5+Er3qZhd+lM8n
	CD7BQlOJNmLTTJXqkrilfFpXjVlBxf+40VUG0bdblX3Epz628EX7+UOtbl3kwoc1kFhOxN/1pNO
	yJGZ4C3m+4NhNWZREc70ehfFlT7Lk++zpkePdYEjE0VjvG2DSZQzauQjheiAq60IF
X-Gm-Gg: ATEYQzz7gbEo0IIz89KOhgoBEA/g3/nY1Q3UlgGeSTVIsPuDx00UUt7h20r9VxUTGP/
	5bEzDCTO/Vv2K8J/ew4M/jATrFRP87q0vMsCgiaCq0ZFTIgZu/sncaMuigh42k4iRbJ3JWHkaHc
	a+iCRVuqTo5kaeDw7ii6THoUOn/7TVwKhhcBO341DV2CSQpAkEywWDAn8Af/AtSbje4YEgxoden
	Ohkb01nDm4UU8HbeJkZR5cOYTE1bQ/vWVRP4IoKgCN07DaTAWbCAoUKtT6ZZdm+zWj9p0CK29Uh
	XSkRBerstRDq8kTyIihxiIvItfFKEl0tEKZzKDUtdTt2TVWXlKt6/ETJ9LvGZaM5S0eXjZh4RQF
	3DDNsHqAvvZF7JjRFfq1zH3hGQ7SLS/q6u5vMCL579QzfZU1mP962RnqjCxNVgdL08ye6YzhKHz
	zgKZmmaA==
X-Received: by 2002:a05:7022:6884:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-12ab291304amr10304083c88.26.1774967015762;
        Tue, 31 Mar 2026 07:23:35 -0700 (PDT)
X-Received: by 2002:a05:7022:6884:b0:11b:88a7:e1b0 with SMTP id a92af1059eb24-12ab291304amr10304043c88.26.1774967015009;
        Tue, 31 Mar 2026 07:23:35 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c68b399bsm9941111eec.17.2026.03.31.07.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 07:23:34 -0700 (PDT)
Message-ID: <b1194bdb-75fa-4f2e-b4a3-9565b11bb3e9@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 07:23:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
 <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
 <20260331-fanatic-elegant-wallaby-913e35@quoll>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260331-fanatic-elegant-wallaby-913e35@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzOSBTYWx0ZWRfXzxz4cyjOoSGo
 YURRbpd1y8Dqo/Ic++eRvLNgzqa0hz3nno5vgrxjVjDdqjvNzoLWNqniZf9QuT/ZneFTdRoHq8S
 UdNLHnmVc01gfZDnEhV+tUsHj5uqxLwByw3K2l3NXc9r5AY4J8PFOogE4we5huResrie5x8nr3B
 ju8Xj1Iu3xQaPi+yJRwfy15S5FcJ6ZmNywPpD6yEKBvDEK8vzp1s+tZT20G21182l/yTAklLY9M
 pevMYhbxYd++63o1MaAnZqlzTQoziUYuJOUbXhEnc9VfYxMdHXbM1sqW4OzAaKXXAo+uEvhNFUs
 zdznk760YIAgseF7pPN4voSE01jZLpNZmEOYSqJPxd0npRNKoB3xHr8PkQOg7YPLGZNTowvFYJu
 DSBJkNy3l+Z/khZjWvF+tW6o0Eupc1isSweiDnmVeuP0oqJn0/UtAjTr2Nof3D2Wz9u7tR/B/oZ
 nL2s+cdCPXBfoBrJCYg==
X-Authority-Analysis: v=2.4 cv=K4wv3iWI c=1 sm=1 tr=0 ts=69cbd8e8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=fnTOxYT96DSTlMw0mmMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: cgTo8yg7WZzL0i03ddQL-UxLcTozHth2
X-Proofpoint-GUID: cgTo8yg7WZzL0i03ddQL-UxLcTozHth2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072337_948525_C812F141 
X-CRM114-Status: GOOD (  13.77  )
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

On 3/31/2026 12:24 AM, Krzysztof Kozlowski wrote:
> On Tue, Mar 31, 2026 at 02:09:06AM +0530, Raj Kumar Bhagat wrote:
>>  $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
>> @@ -17,6 +17,7 @@ properties:
>>    compatible:
>>      enum:
>>        - qcom,ipq5332-wifi
>> +      - qcom,ipq5424-wifi
> 
> No, use previous patch.
> 
> I am annoyed that you keep making changes even for such trivialities and
> require re-review from the community.  Previous patch was correct. This
> one doing whatever you want to do in copyrights is too much. You don't
> change copyrights just because you wrote one device model.

Krzysztof,

FYI here is the guidance I received from Qualcomm legal (links to internal
documentation, removed -- I've forwarded the entire e-mail to your Qualcomm
mailbox):

... Repos under copyleft license [...] QTI copyright must be added when we
make significant changes.

... Repos under friendly license (BSD, Apache, MIT, ...) [...] QTI copyright
must be added for any changes, not just significant ones.

... under the regular QUIC to QTI open-source copyright transitioning [...]
all QUIC Copyright instances should be replaced with year-less QTI OSS Copyright.

I'll follow up with them on this case where there is a dual-license file.

/jeff

